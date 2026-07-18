class Sonarr::Model::EpisodesMonitoredResource < Sonarr::Model

  @[JSON::Field(key: "episodeIds", emit_null: true)]
  property episode_ids : Array(Int32)?

  @[JSON::Field(key: "monitored")]
  property monitored : Bool

end
