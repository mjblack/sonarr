class Sonarr::Model::SelectOption < Sonarr::Model

  @[JSON::Field(key: "value")]
  property value : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "order")]
  property order : Int32

  @[JSON::Field(key: "hint", emit_null: true)]
  property hint : String?

end
