class Sonarr::Model::AutoTaggingSpecificationSchema < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "implementation", emit_null: true)]
  property implementation : String?

  @[JSON::Field(key: "implementationName", emit_null: true)]
  property implementation_name : String?

  @[JSON::Field(key: "negate")]
  property negate : Bool

  @[JSON::Field(key: "required")]
  property required : Bool

  @[JSON::Field(key: "fields", emit_null: true)]
  property fields = [] of Field

end
