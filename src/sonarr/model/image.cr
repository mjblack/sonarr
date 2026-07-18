class Sonarr::Model::Image < Sonarr::Model

  @[JSON::Field(key: "coverType")]
  property cover_type : String

  @[JSON::Field(key: "url")]
  property url : String

  @[JSON::Field(key: "remoteUrl")]
  property remote_url : String?

end
