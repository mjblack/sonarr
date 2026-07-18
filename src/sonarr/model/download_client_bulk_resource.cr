class Sonarr::Model::DownloadClientBulkResource < Sonarr::Model

  @[JSON::Field(key: "ids", emit_null: true)]
  property ids : Array(Int32)?

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags : Array(Int32)?

  @[JSON::Field(key: "applyTags")]
  property apply_tags : Sonarr::ApplyTags

  @[JSON::Field(key: "enable", emit_null: true)]
  property enable : Bool?

  @[JSON::Field(key: "priority", emit_null: true)]
  property priority : Int32?

  @[JSON::Field(key: "removeCompletedDownloads", emit_null: true)]
  property remove_completed_downloads : Bool?

  @[JSON::Field(key: "removeFailedDownloads", emit_null: true)]
  property remove_failed_downloads : Bool?

end
