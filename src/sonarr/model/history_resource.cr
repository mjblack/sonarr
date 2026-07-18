class Sonarr::Model::HistoryResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "episodeId")]
  property episode_id : Int32

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "sourceTitle", emit_null: true)]
  property source_title : String?

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "customFormats", emit_null: true)]
  property custom_formats : Array(CustomFormatResource)?

  @[JSON::Field(key: "customFormatScore")]
  property custom_format_score : Int32

  @[JSON::Field(key: "qualityCutoffNotMet")]
  property quality_cutoff_not_met : Bool

  @[JSON::Field(key: "date")]
  property date : String

  @[JSON::Field(key: "downloadId", emit_null: true)]
  property download_id : String?

  @[JSON::Field(key: "eventType")]
  property event_type : Sonarr::EpisodeHistoryEventType

  @[JSON::Field(key: "data", emit_null: true)]
  property data : Hash(String, String?)?

  @[JSON::Field(key: "episode")]
  property episode : EpisodeResource

  @[JSON::Field(key: "series")]
  property series : SeriesResource

end
