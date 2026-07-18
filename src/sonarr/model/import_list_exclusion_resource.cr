class Sonarr::Model::ImportListExclusionResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "tvdbId")]
  property tvdb_id : Int32

  @[JSON::Field(key: "title", emit_null: true)]
  property title : String?

end
