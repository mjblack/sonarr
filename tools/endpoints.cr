# Endpoint (typed API) generation for the `sonarr` shard.
#
# Extends the model/enum generator (`tools/generate.cr`) with a second pass that
# reads the OpenAPI `paths` object and emits typed endpoint modules under
# `src/sonarr/api/<group>.cr`. Each module is a thin wrapper around a
# `Sonarr::Client`, one class per schema `tag` (group), with one method per
# operation.
#
# Design notes (see the B2 report):
#   * The Sonarr schema has NO `operationId`s, so method names are derived
#     deterministically from the HTTP verb + path (`list`, `get`, `create`,
#     `update`, `delete`, plus `<action>_<subresource>` for nested paths).
#   * Accessor pattern: `Sonarr::Api::Tag.new(client).list`. Each group is a
#     class taking a `Sonarr::Client`; methods delegate to the B1 core
#     (`request` / `request_one` / `request_many`).
#   * Path params interpolate into the URL. Query params build a `Sonarr::Query`
#     (never `apikey` — the client core injects it). Request bodies pass through
#     `body:`. Responses deserialize to the schema's 200 model (array → many,
#     `$ref` → one, no content → `Nil`).
#
# This pass is purely additive: model/enum generation is unchanged.

module Generator
  API_DIR = ROOT / "src" / "sonarr" / "api"

  # Groups (schema `tags`) generated in the B2 pilot. B3 fans this out to all
  # groups; set to `nil` there to emit every group.
  PILOT_GROUPS = %w[Tag Queue History]

  # A single API operation, resolved from the schema.
  record Operation,
    verb : String,
    path : String,
    name : String,
    node : JSON::Any

  # ---- driver ---------------------------------------------------------------

  # Emits one file per pilot group; prunes stale files. Returns the count.
  def self.emit_endpoints(schema : Schema) : Int32
    FileUtils.mkdir_p(API_DIR)

    grouped = operations_by_group(schema)
    expected = Set(String).new

    grouped.keys.sort!.each do |group|
      next unless PILOT_GROUPS.nil? || PILOT_GROUPS.includes?(group)
      file = "#{snake_case(group)}.cr"
      expected << file
      File.write(API_DIR / file, emit_group(schema, group, grouped[group]))
    end

    Dir.glob(API_DIR / "*.cr").each do |path|
      base = File.basename(path)
      File.delete(path) unless expected.includes?(base)
    end

    expected.size
  end

  # Collects operations keyed by schema tag, with unique method names per group.
  def self.operations_by_group(schema : Schema) : Hash(String, Array(Operation))
    grouped = Hash(String, Array(Operation)).new { |hash, key| hash[key] = [] of Operation }

    # Deterministic order: sort by path, then by a fixed verb order.
    verb_order = %w[get post put delete]
    schema.paths.keys.sort!.each do |path|
      verbs = schema.paths[path].as_h
      verbs.keys.sort_by! { |v| verb_order.index(v) || verb_order.size }.each do |verb|
        next unless verb_order.includes?(verb)
        op = verbs[verb]
        tags = op["tags"]?.try(&.as_a.map(&.as_s)) || [] of String
        group = tags.first? || "Default"
        base = method_name(verb, path)
        # De-duplicate within a group (belt-and-braces; the pilot has none).
        existing = grouped[group].map(&.name)
        name = base
        suffix = 2
        while existing.includes?(name)
          name = "#{base}_#{suffix}"
          suffix += 1
        end
        grouped[group] << Operation.new(verb, path, name, op)
      end
    end

    grouped
  end

  # ---- naming ---------------------------------------------------------------

  # Derives a Crystal method name from verb + path (no operationId exists).
  def self.method_name(verb : String, path : String) : String
    segments = path.split('/').reject(&.empty?)
    segments = segments.reject { |seg| seg == "api" || /\Av\d+\z/.matches?(seg) }

    resource = segments.first?
    tail = resource ? segments[1..] : segments
    static_tail = tail.reject(&.starts_with?('{'))
    has_param = path.includes?('{')

    action =
      case verb
      when "get"    then (static_tail.empty? && !has_param) ? "list" : "get"
      when "post"   then "create"
      when "put"    then "update"
      when "delete" then "delete"
      else               verb
      end

    parts = [action] + static_tail.map { |seg| snake_case(seg) }
    name = parts.join('_')
    RESERVED.includes?(name) ? "#{name}_endpoint" : name
  end

  # ---- emitters -------------------------------------------------------------

  def self.emit_group(schema : Schema, group : String, ops : Array(Operation)) : String
    String.build do |io|
      io << HEADER << "\n\n"
      io << "class Sonarr::Api::#{group}\n"
      io << "  def initialize(@client : Sonarr::Client)\n"
      io << "  end\n"
      ops.each do |op|
        io << "\n"
        emit_operation(schema, io, op)
      end
      io << "end\n"
    end
  end

  # Path/query/body parameters resolved to Crystal.
  private record Param, key : String, arg : String, type : String

  def self.emit_operation(schema : Schema, io : IO, op : Operation) : Nil
    params = op.node["parameters"]?.try(&.as_a) || [] of JSON::Any
    path_params = params.select { |prm| prm["in"]? == JSON::Any.new("path") }
      .map { |prm| param_of(schema, prm) }
    query_params = params.select { |prm| prm["in"]? == JSON::Any.new("query") }
      .map { |prm| param_of(schema, prm) }
    body_type = request_body_type(schema, op.node)
    resp = response_shape(schema, op.node)

    # Signature: required path params, then body, then optional query params.
    args = [] of String
    path_params.each { |prm| args << "#{prm.arg} : #{prm.type}" }
    args << "body : #{body_type}" if body_type
    query_params.each { |prm| args << "#{prm.arg} : #{prm.type}? = nil" }
    signature = args.empty? ? "" : "(#{args.join(", ")})"

    io << "  def #{op.name}#{signature} : #{resp[:return]}\n"

    unless query_params.empty?
      io << "    query = Sonarr::Query.new\n"
      query_params.each do |prm|
        io << "    query.add(#{prm.key.inspect}, #{prm.arg})\n"
      end
    end

    io << "    #{request_call(op, resp, path_params, !query_params.empty?, !body_type.nil?)}\n"
    io << "  end\n"
  end

  # Builds the delegating call into the B1 client core.
  def self.request_call(op : Operation, resp, path_params : Array(Param),
                        has_query : Bool, has_body : Bool) : String
    url = url_literal(op.path, path_params)
    query_expr = has_query ? "query" : "nil"
    body_expr = has_body ? "body" : "nil"

    call_args = [":#{op.verb}", url]
    case resp[:kind]
    when :many
      method = "request_many"
      call_args << resp[:type]
    when :one
      method = "request_one"
      call_args << resp[:type]
    else
      method = "request"
    end
    call_args << query_expr << body_expr

    # Drop trailing `nil` arguments (they are the client's own defaults).
    while call_args.last? == "nil"
      call_args.pop
    end

    "@client.#{method}(#{call_args.join(", ")})"
  end

  # Turns `/api/v3/tag/{id}` into a Crystal string literal with interpolation.
  def self.url_literal(path : String, path_params : Array(Param)) : String
    literal = path
    path_params.each do |prm|
      literal = literal.gsub("{#{prm.key}}", "\#{#{prm.arg}}")
    end
    %("#{literal}")
  end

  def self.param_of(schema : Schema, node : JSON::Any) : Param
    key = node["name"].as_s
    Param.new(key, property_name(key), resolve(schema, node["schema"]).expr)
  end

  # Request body Crystal type (from the JSON content schema), or nil if none.
  def self.request_body_type(schema : Schema, op : JSON::Any) : String?
    content = op.dig?("requestBody", "content").try(&.as_h)
    return nil unless content
    media = content["application/json"]? || content.first_value
    node = media["schema"]?
    node ? resolve(schema, node).expr : nil
  end

  # The 200/201 response: :many (array), :one (`$ref`), or :none (no content).
  def self.response_shape(schema : Schema, op : JSON::Any)
    responses = op["responses"]?.try(&.as_h) || {} of String => JSON::Any
    success = responses["200"]? || responses["201"]?
    content = success.try(&.dig?("content")).try(&.as_h)

    unless content
      return {kind: :none, type: "Nil", return: "Nil"}
    end

    media = content["application/json"]? || content.first_value
    node = media["schema"]

    if node["type"]? == JSON::Any.new("array")
      item = resolve(schema, node["items"]).expr
      {kind: :many, type: item, return: "Array(#{item})"}
    else
      type = resolve(schema, node).expr
      {kind: :one, type: type, return: "#{type}?"}
    end
  end
end
