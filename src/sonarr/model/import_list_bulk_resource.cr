class Sonarr::Model::ImportListBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags : Array(Int32)?

  @[JSON::Field(key: "applyTags")]
  property apply_tags : Sonarr::ApplyTags

  @[JSON::Field(key: "enableAutomaticAdd", emit_null: true)]
  property enable_automatic_add : Bool?

  @[JSON::Field(key: "rootFolderPath", emit_null: true)]
  property root_folder_path : String?

  @[JSON::Field(key: "qualityProfileId", emit_null: true)]
  property quality_profile_id : Int32?

end
