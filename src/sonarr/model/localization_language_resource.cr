class Sonarr::Model::LocalizationLanguageResource < Sonarr::Model

  @[JSON::Field(key: "identifier", emit_null: true)]
  property identifier : String?

end
