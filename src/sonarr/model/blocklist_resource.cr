class Sonarr::Model::BlocklistResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "episodeIds", emit_null: true)]
  property episode_ids : Array(Int32)?

  @[JSON::Field(key: "sourceTitle", emit_null: true)]
  property source_title : String?

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "customFormats", emit_null: true)]
  property custom_formats : Array(CustomFormatResource)?

  @[JSON::Field(key: "date")]
  property date : String

  @[JSON::Field(key: "protocol")]
  property protocol : Sonarr::DownloadProtocol

  @[JSON::Field(key: "indexer", emit_null: true)]
  property indexer : String?

  @[JSON::Field(key: "message", emit_null: true)]
  property message : String?

  @[JSON::Field(key: "series")]
  property series : SeriesResource

end
