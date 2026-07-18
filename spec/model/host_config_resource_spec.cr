require "../spec_helper"

describe Sonarr::Model::HostConfigResource do
  it "parses an empty object (all properties optional)" do
    config = Sonarr::Model::HostConfigResource.from_json("{}")
    config.id.should be_nil
    config.authentication_method.should be_nil
    config.update_mechanism.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "bindAddress": "0.0.0.0",
      "port": 8989,
      "sslPort": 9898,
      "enableSsl": false,
      "launchBrowser": true,
      "authenticationMethod": "forms",
      "authenticationRequired": "enabled",
      "analyticsEnabled": true,
      "username": "admin",
      "password": "password",
      "logLevel": "info",
      "logSizeLimit": 100,
      "consoleLogLevel": "info",
      "branch": "main",
      "apiKey": "test123",
      "sslCertPath": "/path/to/cert",
      "sslCertPassword": "certpass",
      "urlBase": "",
      "instanceName": "Test Instance",
      "applicationUrl": "http://localhost:8989",
      "updateAutomatically": true,
      "updateMechanism": "builtIn",
      "updateScriptPath": "/path/to/script",
      "proxyEnabled": false,
      "proxyType": "http",
      "proxyHostname": "proxy.example.com",
      "proxyPort": 8080,
      "proxyUsername": "proxyuser",
      "proxyPassword": "proxypass",
      "proxyBypassFilter": "",
      "proxyBypassLocalAddresses": true,
      "certificateValidation": "enabled",
      "backupFolder": "/path/to/backup",
      "backupInterval": 7,
      "backupRetention": 28,
      "trustCgnatIpAddresses": false
    })
    config = Sonarr::Model::HostConfigResource.from_json(json)
    config.id.should eq(1)
    config.bind_address.should eq("0.0.0.0")
    config.port.should eq(8989)
    config.ssl_port.should eq(9898)
    config.enable_ssl.should eq(false)
    config.launch_browser.should eq(true)
    config.authentication_method.should eq(Sonarr::AuthenticationType::Forms)
    config.authentication_required.should eq(Sonarr::AuthenticationRequiredType::Enabled)
    config.analytics_enabled.should eq(true)
    config.username.should eq("admin")
    config.password.should eq("password")
    config.log_level.should eq("info")
    config.log_size_limit.should eq(100)
    config.console_log_level.should eq("info")
    config.branch.should eq("main")
    config.api_key.should eq("test123")
    config.ssl_cert_path.should eq("/path/to/cert")
    config.ssl_cert_password.should eq("certpass")
    config.url_base.should eq("")
    config.instance_name.should eq("Test Instance")
    config.application_url.should eq("http://localhost:8989")
    config.update_automatically.should eq(true)
    config.update_mechanism.should eq(Sonarr::UpdateMechanism::BuiltIn)
    config.update_script_path.should eq("/path/to/script")
    config.proxy_enabled.should eq(false)
    config.proxy_type.should eq(Sonarr::ProxyType::Http)
    config.proxy_hostname.should eq("proxy.example.com")
    config.proxy_port.should eq(8080)
    config.proxy_username.should eq("proxyuser")
    config.proxy_password.should eq("proxypass")
    config.proxy_bypass_filter.should eq("")
    config.proxy_bypass_local_addresses.should eq(true)
    config.certificate_validation.should eq(Sonarr::CertificateValidationType::Enabled)
    config.backup_folder.should eq("/path/to/backup")
    config.backup_interval.should eq(7)
    config.backup_retention.should eq(28)
    config.trust_cgnat_ip_addresses.should eq(false)
  end
end
