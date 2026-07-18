class Sonarr::Model::EpisodeFileListResource < Sonarr::Model

  @[JSON::Field(key: "episodeFileIds", emit_null: true)]
  property episode_file_ids : Array(Int32)?

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "sceneName", emit_null: true)]
  property scene_name : String?

  @[JSON::Field(key: "releaseGroup", emit_null: true)]
  property release_group : String?

end
