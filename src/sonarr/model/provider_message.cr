class Sonarr::Model::ProviderMessage < Sonarr::Model

  @[JSON::Field(key: "message", emit_null: true)]
  property message : String?

  @[JSON::Field(key: "type")]
  property type : Sonarr::ProviderMessageType

end
