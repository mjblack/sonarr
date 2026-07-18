class Sonarr::Model::CustomFilterResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "type", emit_null: true)]
  property type : String?

  @[JSON::Field(key: "label", emit_null: true)]
  property label : String?

  @[JSON::Field(key: "filters", emit_null: true)]
  property filters : Array(Hash(String, JSON::Any))?

end
