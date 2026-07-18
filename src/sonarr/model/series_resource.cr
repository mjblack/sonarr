class Sonarr::Model::SeriesResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "title", emit_null: true)]
  property title : String?

  @[JSON::Field(key: "alternateTitles", emit_null: true)]
  property alternate_titles = [] of AlternateTitleResource

  @[JSON::Field(key: "sortTitle", emit_null: true)]
  property sort_title : String?

  @[JSON::Field(key: "status")]
  property status : Sonarr::SeriesStatusType

  @[JSON::Field(key: "ended")]
  property ended : Bool

  @[JSON::Field(key: "profileName", emit_null: true)]
  property profile_name : String?

  @[JSON::Field(key: "overview", emit_null: true)]
  property overview : String?

  @[JSON::Field(key: "nextAiring", emit_null: true)]
  property next_airing : Time?

  @[JSON::Field(key: "previousAiring", emit_null: true)]
  property previous_airing : Time?

  @[JSON::Field(key: "network", emit_null: true)]
  property network : String?

  @[JSON::Field(key: "airTime", emit_null: true)]
  property air_time : String?

  @[JSON::Field(key: "images", emit_null: true)]
  property images = [] of MediaCover

  @[JSON::Field(key: "originalLanguage")]
  property original_language : Language

  @[JSON::Field(key: "remotePoster", emit_null: true)]
  property remote_poster : String?

  @[JSON::Field(key: "seasons", emit_null: true)]
  property seasons = [] of SeasonResource

  @[JSON::Field(key: "year")]
  property year : Int32

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "qualityProfileId")]
  property quality_profile_id : Int32

  @[JSON::Field(key: "seasonFolder")]
  property season_folder : Bool

  @[JSON::Field(key: "monitored")]
  property monitored : Bool

  @[JSON::Field(key: "monitorNewItems")]
  property monitor_new_items : Sonarr::NewItemMonitorTypes

  @[JSON::Field(key: "useSceneNumbering")]
  property use_scene_numbering : Bool

  @[JSON::Field(key: "runtime")]
  property runtime : Int32

  @[JSON::Field(key: "tvdbId")]
  property tvdb_id : Int32

  @[JSON::Field(key: "tvRageId")]
  property tv_rage_id : Int32

  @[JSON::Field(key: "tvMazeId")]
  property tv_maze_id : Int32

  @[JSON::Field(key: "tmdbId")]
  property tmdb_id : Int32

  @[JSON::Field(key: "firstAired", emit_null: true)]
  property first_aired : Time?

  @[JSON::Field(key: "lastAired", emit_null: true)]
  property last_aired : Time?

  @[JSON::Field(key: "seriesType")]
  property series_type : Sonarr::SeriesTypes

  @[JSON::Field(key: "cleanTitle", emit_null: true)]
  property clean_title : String?

  @[JSON::Field(key: "imdbId", emit_null: true)]
  property imdb_id : String?

  @[JSON::Field(key: "titleSlug", emit_null: true)]
  property title_slug : String?

  @[JSON::Field(key: "rootFolderPath", emit_null: true)]
  property root_folder_path : String?

  @[JSON::Field(key: "folder", emit_null: true)]
  property folder : String?

  @[JSON::Field(key: "certification", emit_null: true)]
  property certification : String?

  @[JSON::Field(key: "genres", emit_null: true)]
  property genres = [] of String

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags = [] of Int32

  @[JSON::Field(key: "added")]
  property added : Time

  @[JSON::Field(key: "addOptions", emit_null: true)]
  property add_options : AddSeriesOptions?

  @[JSON::Field(key: "ratings")]
  property ratings : Ratings

  @[JSON::Field(key: "statistics", emit_null: true)]
  property statistics : SeriesStatisticsResource?

  @[JSON::Field(key: "episodesChanged", emit_null: true)]
  property? episodes_changed : Bool?

  @[JSON::Field(key: "languageProfileId", emit_null: true)]
  property language_profile_id : Int32?

end
