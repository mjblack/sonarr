class Sonarr::Model::SystemResource < Sonarr::Model

  @[JSON::Field(key: "appName", emit_null: true)]
  property app_name : String?

  @[JSON::Field(key: "instanceName", emit_null: true)]
  property instance_name : String?

  @[JSON::Field(key: "version", emit_null: true)]
  property version : String?

  @[JSON::Field(key: "buildTime")]
  property build_time : String

  @[JSON::Field(key: "isDebug")]
  property is_debug : Bool

  @[JSON::Field(key: "isProduction")]
  property is_production : Bool

  @[JSON::Field(key: "isAdmin")]
  property is_admin : Bool

  @[JSON::Field(key: "isUserInteractive")]
  property is_user_interactive : Bool

  @[JSON::Field(key: "startupPath", emit_null: true)]
  property startup_path : String?

  @[JSON::Field(key: "appData", emit_null: true)]
  property app_data : String?

  @[JSON::Field(key: "osName", emit_null: true)]
  property os_name : String?

  @[JSON::Field(key: "osVersion", emit_null: true)]
  property os_version : String?

  @[JSON::Field(key: "isNetCore")]
  property is_net_core : Bool

  @[JSON::Field(key: "isLinux")]
  property is_linux : Bool

  @[JSON::Field(key: "isOsx")]
  property is_osx : Bool

  @[JSON::Field(key: "isWindows")]
  property is_windows : Bool

  @[JSON::Field(key: "isDocker")]
  property is_docker : Bool

  @[JSON::Field(key: "mode")]
  property mode : Sonarr::RuntimeMode

  @[JSON::Field(key: "branch", emit_null: true)]
  property branch : String?

  @[JSON::Field(key: "authentication")]
  property authentication : Sonarr::AuthenticationType

  @[JSON::Field(key: "sqliteVersion", emit_null: true)]
  property sqlite_version : String?

  @[JSON::Field(key: "migrationVersion")]
  property migration_version : Int32

  @[JSON::Field(key: "urlBase", emit_null: true)]
  property url_base : String?

  @[JSON::Field(key: "runtimeVersion", emit_null: true)]
  property runtime_version : String?

  @[JSON::Field(key: "runtimeName", emit_null: true)]
  property runtime_name : String?

  @[JSON::Field(key: "startTime")]
  property start_time : String

  @[JSON::Field(key: "packageVersion", emit_null: true)]
  property package_version : String?

  @[JSON::Field(key: "packageAuthor", emit_null: true)]
  property package_author : String?

  @[JSON::Field(key: "packageUpdateMechanism")]
  property package_update_mechanism : Sonarr::UpdateMechanism

  @[JSON::Field(key: "packageUpdateMechanismMessage", emit_null: true)]
  property package_update_mechanism_message : String?

  @[JSON::Field(key: "databaseVersion", emit_null: true)]
  property database_version : String?

  @[JSON::Field(key: "databaseType")]
  property database_type : Sonarr::DatabaseType

end
