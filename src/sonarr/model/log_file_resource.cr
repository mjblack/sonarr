class Sonarr::Model::LogFileResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "filename", emit_null: true)]
  property filename : String?

  @[JSON::Field(key: "lastWriteTime")]
  property last_write_time : String

  @[JSON::Field(key: "contentsUrl", emit_null: true)]
  property contents_url : String?

  @[JSON::Field(key: "downloadUrl", emit_null: true)]
  property download_url : String?

end
