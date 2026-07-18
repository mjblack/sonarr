class Sonarr::Model::CustomFormatBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

  @[JSON::Field(key: "includeCustomFormatWhenRenaming", emit_null: true)]
  property include_custom_format_when_renaming : Bool?

end
