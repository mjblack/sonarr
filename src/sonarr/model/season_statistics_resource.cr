class Sonarr::Model::SeasonStatisticsResource < Sonarr::Model

  @[JSON::Field(key: "nextAiring", emit_nil: true)]
  property next_airing : String?

  @[JSON::Field(key: "previousAiring", emit_nil: true)]
  property next_airing : String?

  @[JSON::Field(key: "episodeFileCount")]
  property episode_file_count : Int32

  @[JSON::Field(key: "episodeCount")]
  property episode_count : Int32

  @[JSON::Field(key: "totalEpisodeCount")]
  property total_episode_count : Int32

  @[JSON::Field(key: "sizeOnDisk")]
  property size_on_disk : Int64

  @[JSON::Field(key: "releaseGroups", emit_nil: true)]
  property release_groups = [] of String

  @[JSON::Field(key: "percentOfEpisodes")]
  property percent_of_episodes : Float64

end
