class Sonarr::Model::IndexerBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags : Array(Int32)?

  @[JSON::Field(key: "applyTags")]
  property apply_tags : Sonarr::ApplyTags

  @[JSON::Field(key: "enableRss", emit_null: true)]
  property enable_rss : Bool?

  @[JSON::Field(key: "enableAutomaticSearch", emit_null: true)]
  property enable_automatic_search : Bool?

  @[JSON::Field(key: "enableInteractiveSearch", emit_null: true)]
  property enable_interactive_search : Bool?

  @[JSON::Field(key: "priority", emit_null: true)]
  property priority : Int32?

end
