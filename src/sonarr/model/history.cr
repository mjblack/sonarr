class Sonarr::Model::History < Sonarr::Model

  @[JSON::Field(key: "episodeId")]
  property episode_id : Int32

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "sourceTitle")]
  property source_title : String

  @[JSON::Field(key: "quality")]
  property quality : Quality

  @[JSON::Field(key: "qualityCutoffNotMet")]
  property quality_cutoff_not_met : Bool

  @[JSON::Field(key: "date")]
  property date : Time

  @[JSON::Field(key: "downloadId")]
  property download_id : String

  @[JSON::Field(key: "eventType")]
  property event_type : String

  @[JSON::Field(key: "data")]
  property data = {} of String => String

  @[JSON::Field(key: "id")]
  property id : Int32
end
