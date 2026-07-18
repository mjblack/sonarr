class Sonarr::Model::DownloadClientResource < Sonarr::Model

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
  property presets : Array(DownloadClientResource)?

  @[JSON::Field(key: "enable")]
  property enable : Bool

  @[JSON::Field(key: "protocol")]
  property protocol : Sonarr::DownloadProtocol

  @[JSON::Field(key: "priority")]
  property priority : Int32

  @[JSON::Field(key: "removeCompletedDownloads")]
  property remove_completed_downloads : Bool

  @[JSON::Field(key: "removeFailedDownloads")]
  property remove_failed_downloads : Bool

end
