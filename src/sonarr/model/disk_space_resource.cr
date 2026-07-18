class Sonarr::Model::DiskSpaceResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "label", emit_null: true)]
  property label : String?

  @[JSON::Field(key: "freeSpace")]
  property free_space : Int64

  @[JSON::Field(key: "totalSpace")]
  property total_space : Int64

end
