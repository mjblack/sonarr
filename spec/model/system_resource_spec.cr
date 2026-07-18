require "../spec_helper"

describe Sonarr::Model::SystemResource do
  it "parses JSON with all required fields" do
    json = %({
      "appName": "Sonarr",
      "instanceName": "Test Instance",
      "version": "3.0.0",
      "buildTime": "2023-01-01T12:00:00Z",
      "isDebug": false,
      "isProduction": true,
      "isAdmin": true,
      "isUserInteractive": false,
      "startupPath": "/path/to/sonarr",
      "appData": "/path/to/appdata",
      "osName": "Linux",
      "osVersion": "Ubuntu 20.04",
      "isNetCore": true,
      "isLinux": true,
      "isOsx": false,
      "isWindows": false,
      "isDocker": false,
      "mode": "Console",
      "branch": "main",
      "authentication": "forms",
      "sqliteVersion": "3.36.0",
      "migrationVersion": 1,
      "urlBase": "",
      "runtimeVersion": "6.0.0",
      "runtimeName": ".NET",
      "startTime": "2023-01-01T12:00:00Z",
      "packageVersion": "3.0.0",
      "packageAuthor": "Sonarr Team",
      "packageUpdateMechanism": "docker",
      "packageUpdateMechanismMessage": "Docker container",
      "databaseVersion": "3.0.0",
      "databaseType": "sqlite"
    })
    system = Sonarr::Model::SystemResource.from_json(json)
    system.app_name.should eq("Sonarr")
    system.instance_name.should eq("Test Instance")
    system.version.should eq("3.0.0")
    system.build_time.should eq("2023-01-01T12:00:00Z")
    system.is_debug.should eq(false)
    system.is_production.should eq(true)
    system.is_admin.should eq(true)
    system.is_user_interactive.should eq(false)
    system.startup_path.should eq("/path/to/sonarr")
    system.app_data.should eq("/path/to/appdata")
    system.os_name.should eq("Linux")
    system.os_version.should eq("Ubuntu 20.04")
    system.is_net_core.should eq(true)
    system.is_linux.should eq(true)
    system.is_osx.should eq(false)
    system.is_windows.should eq(false)
    system.is_docker.should eq(false)
    system.mode.should eq(Sonarr::RuntimeMode::Console)
    system.branch.should eq("main")
    system.authentication.should eq(Sonarr::AuthenticationType::Forms)
    system.sqlite_version.should eq("3.36.0")
    system.migration_version.should eq(1)
    system.url_base.should eq("")
    system.runtime_version.should eq("6.0.0")
    system.runtime_name.should eq(".NET")
    system.start_time.should eq("2023-01-01T12:00:00Z")
    system.package_version.should eq("3.0.0")
    system.package_author.should eq("Sonarr Team")
    system.package_update_mechanism.should eq(Sonarr::UpdateMechanism::Docker)
    system.package_update_mechanism_message.should eq("Docker container")
    system.database_version.should eq("3.0.0")
    system.database_type.should eq(Sonarr::DatabaseType::SQLite)
  end
end 