class Sonarr::Model::AddSeriesOptions < Sonarr::Model

  @[JSON::Field(key: "ignoreEpisodesWithFiles")]
  property? ignore_episodes_with_files : Bool = false

  @[JSON::Field(key: "ignoreEpisodesWithoutFiles")]
  property? ignore_episodes_without_files : Bool = false

  @[JSON::Field(key: "monitor")]
  property monitor : Sonarr::MonitorType = Sonarr::MonitorType::Unknown

  @[JSON::Field(key: "searchForMissingEpisodes")]
  property? search_for_missing_episodes : Bool = false

  @[JSON::Field(key: "searchForCutOffUnmetEpisodes")]
  property? search_for_cut_off_unmet_episodes : Bool = false

end
