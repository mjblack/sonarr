class Sonarr::Model::CustomFormatSpecificationSchema < Sonarr::Model

  @[JSON::Field]
  property id : Int32

  @[JSON::Field(emit_nil: true)]
  property name : String?

  @[JSON::Field(emit_nil: true)]
  property implementation : String?

  @[JSON::Field(key: "implementationName", emit_nil: true)]
  property implementation_name : String?

  @[JSON::Field(key: "infoLink", emit_nil: true)]
  property info_link : String?

  @[JSON::Field]
  property negate : Bool

  @[JSON::Field]
  property required : Bool

  @[JSON::Field]
  property fields = [] of Field

  @[JSON::Field]
  property presets = [] of String

end
