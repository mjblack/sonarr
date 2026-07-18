class Sonarr::Model::LanguageResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "nameLower", emit_null: true)]
  property name_lower : String?

end
