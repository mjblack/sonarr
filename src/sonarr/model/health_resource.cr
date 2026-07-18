class Sonarr::Model::HealthResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "source", emit_null: true)]
  property source : String?

  @[JSON::Field(key: "type")]
  property type : Sonarr::HealthCheckResult

  @[JSON::Field(key: "message", emit_null: true)]
  property message : String?

  @[JSON::Field(key: "wikiUrl")]
  property wiki_url : HttpUri

end
