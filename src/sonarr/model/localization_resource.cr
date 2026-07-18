class Sonarr::Model::LocalizationResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "strings", emit_null: true)]
  property strings : Hash(String, String?)?

end
