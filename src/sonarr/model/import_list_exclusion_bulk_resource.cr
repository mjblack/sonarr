class Sonarr::Model::ImportListExclusionBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

end
