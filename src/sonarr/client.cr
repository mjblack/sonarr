class Sonarr::Client

  getter endpoint : URI
  @api_key : String
  @headers = {} of String => String
  @client : Crest::Resource

  @@instance : Sonarr::Client?

  private def initialize(@endpoint : URI, @api_key : String)
    @headers["X-Api-Key"] = @api_key
    # @headers["Content-Type"] = "application/json"
    @headers["Accept"] = "application/json"
    # @headers["Accept"] = "*/*"
    # @headers["User-Agent"] = "Sonarr Crystal Client"
    @client = Crest::Resource.new(@endpoint.to_s, params: { "apikey" => @api_key }, headers: @headers)
  end

  def request(method : Symbol, path : String, params = {} of String => String)
    puts "requesting #{method} #{path} with params #{params.inspect} and headers #{@headers.inspect}"
    params["apikey"] = @api_key
    puts params.inspect
    response = Crest::Request.execute(
      method,
      "#{@endpoint}/#{path}",
      headers: @headers,
      params: params
    )

    puts response.headers.inspect
    response.body
  end

  {% for method in [:get, :post, :put, :delete] %}
  def {{method.id}}(path : String, params = {} of String => String)
    # request(:{{method.id}}, path, params)
    response = @client[path].{{method.id}}(
      params: params.merge({"apikey" => @api_key})
    )
    response.body
  end

  def self.{{method.id}}(path : String, params = {} of String => String)
    instance.{{method.id}}(path, params)
  end
  {% end %}

  def self.new(endpoint : String, api_key : String)
    @@instance = new(URI.parse(endpoint), api_key)
    self.instance
  end

  def self.instance
    if i = @@instance
      i
    else
      raise "Sonarr Client has not been initialized"
    end
  end

end