class Sonarr::Model::ImportListConfigResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "listSyncLevel")]
  property list_sync_level : Sonarr::ListSyncLevelType

  @[JSON::Field(key: "listSyncTag")]
  property list_sync_tag : Int32

end
