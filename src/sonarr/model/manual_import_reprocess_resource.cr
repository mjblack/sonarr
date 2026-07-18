class Sonarr::Model::ManualImportReprocessResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "seasonNumber", emit_null: true)]
  property season_number : Int32?

  @[JSON::Field(key: "episodes", emit_null: true)]
  property episodes : Array(EpisodeResource)?

  @[JSON::Field(key: "episodeIds", emit_null: true)]
  property episode_ids : Array(Int32)?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "releaseGroup", emit_null: true)]
  property release_group : String?

  @[JSON::Field(key: "downloadId", emit_null: true)]
  property download_id : String?

  @[JSON::Field(key: "customFormats", emit_null: true)]
  property custom_formats : Array(CustomFormatResource)?

  @[JSON::Field(key: "customFormatScore")]
  property custom_format_score : Int32

  @[JSON::Field(key: "indexerFlags")]
  property indexer_flags : Int32

  @[JSON::Field(key: "releaseType")]
  property release_type : Sonarr::ReleaseType

  @[JSON::Field(key: "rejections", emit_null: true)]
  property rejections : Array(ImportRejectionResource)?

end
