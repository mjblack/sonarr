class Sonarr::Model::ImportListResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "fields", emit_null: true)]
  property fields : Array(Field)?

  @[JSON::Field(key: "implementationName", emit_null: true)]
  property implementation_name : String?

  @[JSON::Field(key: "implementation", emit_null: true)]
  property implementation : String?

  @[JSON::Field(key: "configContract", emit_null: true)]
  property config_contract : String?

  @[JSON::Field(key: "infoLink", emit_null: true)]
  property info_link : String?

  @[JSON::Field(key: "message")]
  property message : ProviderMessage

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags : Array(Int32)?

  @[JSON::Field(key: "presets", emit_null: true)]
  property presets : Array(ImportListResource)?

  @[JSON::Field(key: "enableAutomaticAdd")]
  property enable_automatic_add : Bool

  @[JSON::Field(key: "searchForMissingEpisodes")]
  property search_for_missing_episodes : Bool

  @[JSON::Field(key: "shouldMonitor")]
  property should_monitor : Sonarr::MonitorType

  @[JSON::Field(key: "monitorNewItems")]
  property monitor_new_items : Sonarr::NewItemMonitorTypes

  @[JSON::Field(key: "rootFolderPath", emit_null: true)]
  property root_folder_path : String?

  @[JSON::Field(key: "qualityProfileId")]
  property quality_profile_id : Int32

  @[JSON::Field(key: "seriesType")]
  property series_type : Sonarr::SeriesTypes

  @[JSON::Field(key: "seasonFolder")]
  property season_folder : Bool

  @[JSON::Field(key: "listType")]
  property list_type : Sonarr::ImportListType

  @[JSON::Field(key: "listOrder")]
  property list_order : Int32

  @[JSON::Field(key: "minRefreshInterval")]
  property min_refresh_interval : String

end
