class Sonarr::Model::BlocklistBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

end
