class Sonarr::Model::ImportRejectionResource < Sonarr::Model

  @[JSON::Field(key: "reason", emit_null: true)]
  property reason : String?

  @[JSON::Field(key: "type")]
  property type : Sonarr::RejectionType

end
