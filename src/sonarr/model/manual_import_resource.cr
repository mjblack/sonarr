class Sonarr::Model::ManualImportResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "relativePath", emit_null: true)]
  property relative_path : String?

  @[JSON::Field(key: "folderName", emit_null: true)]
  property folder_name : String?

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "size")]
  property size : Int64

  @[JSON::Field(key: "series")]
  property series : SeriesResource

  @[JSON::Field(key: "seasonNumber", emit_null: true)]
  property season_number : Int32?

  @[JSON::Field(key: "episodes", emit_null: true)]
  property episodes : Array(EpisodeResource)?

  @[JSON::Field(key: "episodeFileId", emit_null: true)]
  property episode_file_id : Int32?

  @[JSON::Field(key: "releaseGroup", emit_null: true)]
  property release_group : String?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "qualityWeight")]
  property quality_weight : Int32

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
