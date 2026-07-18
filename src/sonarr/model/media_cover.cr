class Sonarr::Model::MediaCover < Sonarr::Model

  @[JSON::Field(key: "coverType")]
  property cover_type : String

  @[JSON::Field(key: "url", emit_nil: true)]
  property url : String?

  @[JSON::Field(key: "remoteUrl", emit_nil: true)]
  property remote_url : String?

end