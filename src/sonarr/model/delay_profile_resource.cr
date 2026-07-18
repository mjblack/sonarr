class Sonarr::Model::DelayProfileResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "enableUsenet")]
  property enable_usenet : Bool

  @[JSON::Field(key: "enableTorrent")]
  property enable_torrent : Bool

  @[JSON::Field(key: "preferredProtocol")]
  property preferred_protocol : Sonarr::DownloadProtocol

  @[JSON::Field(key: "usenetDelay")]
  property usenet_delay : Int32

  @[JSON::Field(key: "torrentDelay")]
  property torrent_delay : Int32

  @[JSON::Field(key: "bypassIfHighestQuality")]
  property bypass_if_highest_quality : Bool

  @[JSON::Field(key: "bypassIfAboveCustomFormatScore")]
  property bypass_if_above_custom_format_score : Bool

  @[JSON::Field(key: "minimumCustomFormatScore")]
  property minimum_custom_format_score : Int32

  @[JSON::Field(key: "order")]
  property order : Int32

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags : Array(Int32)?

end
