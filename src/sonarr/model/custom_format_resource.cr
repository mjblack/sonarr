class Sonarr::Model::CustomFormatResource < Sonarr::Model
  @[JSON::Field]
  property id : Int32

  @[JSON::Field(key: "name", emit_nil: true)]
  property name : String?

  @[JSON::Field(key: "includeCustomFormatWhenRenaming", emit_nil: true)]
  property? include_custom_format_when_renaming : Bool?

  @[JSON::Field(key: "specifications")]
  property specifications = [] of CustomFormatSpecificationSchema

end
