class Sonarr::Model::EpisodeFileResource < Sonarr::Model

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "seasonNumber")]
  property season_number : Int32

  @[JSON::Field(key: "relativePath", emit_null: true)]
  property relative_path : String?

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "size")]
  property size : Int64

  @[JSON::Field(key: "dateAdded")]
  property date_added : Time

  @[JSON::Field(key: "sceneName", emit_null: true)]
  property scene_name : String?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "languages")]
  property languages = [] of Language

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "releaseGroup", emit_null: true)]
  property release_group : String?

  @[JSON::Field(key: "customFormats", emit_null: true)]
  property custom_formats = [] of CustomFormatResource

  @[JSON::Field(key: "customFormatScore")]
  property custom_format_score : Int32

  @[JSON::Field(key: "indexerFlags", emit_null: true)]
  property indexer_flags : Int32?

  @[JSON::Field(key: "releaseType")]
  property release_type : ReleaseType

  @[JSON::Field(key: "mediaInfo")]
  property media_info : MediaInfoResource

  @[JSON::Field(key: "qualityCutoffNotMet")]
  property? quality_cutoff_not_met : Bool

end
