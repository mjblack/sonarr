class Sonarr::Model::EpisodeResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "seriesId")]
  property series_id : Int32

  @[JSON::Field(key: "tvdbId")]
  property tvdb_id : Int32

  @[JSON::Field(key: "episodeFileId")]
  property episode_file_id : Int32

  @[JSON::Field(key: "seasonNumber")]
  property season_number : Int32

  @[JSON::Field(key: "episodeNumber")]
  property episode_number : Int32

  @[JSON::Field(emit_nil: true)]
  property title : String?

  @[JSON::Field(key: "airDate", emit_nil: true)]
  property air_date : String?

  @[JSON::Field(key: "airDateUtc", emit_nil: true)]
  property air_date_utc : Time?

  @[JSON::Field(key: "lastSearchTime", emit_nil: true)]
  property last_search_time : Time?

  @[JSON::Field(key: "runtime")]
  property runtime : Int32

  @[JSON::Field(key: "finaleType", emit_nil: true)]
  property finale_type : String?

  @[JSON::Field(emit_nil: true)]
  property overview : String?

  @[JSON::Field(key: "episodeFile")]
  property episode_file : EpisodeFileResource

  @[JSON::Field(key: "hasFile")]
  property has_file : Bool

  @[JSON::Field(key: "monitored")]
  property monitored : Bool

  @[JSON::Field(key: "absoluteEpisodeNumber", emit_nil: true)]
  property absolute_episode_number : Int32?

  @[JSON::Field(key: "sceneAbsoluteEpisodeNumber", emit_nil: true)]
  property scene_absolute_episode_number : Int32?

  @[JSON::Field(key: "sceneEpisodeNumber")]
  property scene_episode_number : Int32?

  @[JSON::Field(key: "sceneSeasonNumber", emit_nil: true)]
  property scene_season_number : Int32?

  @[JSON::Field(key: "unverifiedSceneNumbering")]
  property? unverified_scene_numbering : Bool

  @[JSON::Field(key: "endTime", emit_nil: true)]
  property end_time : Time?

  @[JSON::Field(key: "grabDate", emit_nil: true)]
  property grab_date : Time?

  @[JSON::Field(key: "series")]
  property series : SeriesResource

  @[JSON::Field(key: "images")]
  property images = [] of MediaCover

end