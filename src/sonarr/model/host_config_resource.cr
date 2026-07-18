class Sonarr::Model::HostConfigResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "bindAddress", emit_null: true)]
  property bind_address : String?

  @[JSON::Field(key: "port")]
  property port : Int32

  @[JSON::Field(key: "sslPort")]
  property ssl_port : Int32

  @[JSON::Field(key: "enableSsl")]
  property enable_ssl : Bool

  @[JSON::Field(key: "launchBrowser")]
  property launch_browser : Bool

  @[JSON::Field(key: "authenticationMethod")]
  property authentication_method : Sonarr::AuthenticationType

  @[JSON::Field(key: "authenticationRequired")]
  property authentication_required : Sonarr::AuthenticationRequiredType

  @[JSON::Field(key: "analyticsEnabled")]
  property analytics_enabled : Bool

  @[JSON::Field(key: "username", emit_null: true)]
  property username : String?

  @[JSON::Field(key: "password", emit_null: true)]
  property password : String?

  @[JSON::Field(key: "passwordConfirmation", emit_null: true)]
  property password_confirmation : String?

  @[JSON::Field(key: "logLevel", emit_null: true)]
  property log_level : String?

  @[JSON::Field(key: "logSizeLimit")]
  property log_size_limit : Int32

  @[JSON::Field(key: "consoleLogLevel", emit_null: true)]
  property console_log_level : String?

  @[JSON::Field(key: "branch", emit_null: true)]
  property branch : String?

  @[JSON::Field(key: "apiKey", emit_null: true)]
  property api_key : String?

  @[JSON::Field(key: "sslCertPath", emit_null: true)]
  property ssl_cert_path : String?

  @[JSON::Field(key: "sslCertPassword", emit_null: true)]
  property ssl_cert_password : String?

  @[JSON::Field(key: "urlBase", emit_null: true)]
  property url_base : String?

  @[JSON::Field(key: "instanceName", emit_null: true)]
  property instance_name : String?

  @[JSON::Field(key: "applicationUrl", emit_null: true)]
  property application_url : String?

  @[JSON::Field(key: "updateAutomatically")]
  property update_automatically : Bool

  @[JSON::Field(key: "updateMechanism")]
  property update_mechanism : Sonarr::UpdateMechanism

  @[JSON::Field(key: "updateScriptPath", emit_null: true)]
  property update_script_path : String?

  @[JSON::Field(key: "proxyEnabled")]
  property proxy_enabled : Bool

  @[JSON::Field(key: "proxyType")]
  property proxy_type : Sonarr::ProxyType

  @[JSON::Field(key: "proxyHostname", emit_null: true)]
  property proxy_hostname : String?

  @[JSON::Field(key: "proxyPort")]
  property proxy_port : Int32

  @[JSON::Field(key: "proxyUsername", emit_null: true)]
  property proxy_username : String?

  @[JSON::Field(key: "proxyPassword", emit_null: true)]
  property proxy_password : String?

  @[JSON::Field(key: "proxyBypassFilter", emit_null: true)]
  property proxy_bypass_filter : String?

  @[JSON::Field(key: "proxyBypassLocalAddresses")]
  property proxy_bypass_local_addresses : Bool

  @[JSON::Field(key: "certificateValidation")]
  property certificate_validation : Sonarr::CertificateValidationType

  @[JSON::Field(key: "backupFolder", emit_null: true)]
  property backup_folder : String?

  @[JSON::Field(key: "backupInterval")]
  property backup_interval : Int32

  @[JSON::Field(key: "backupRetention")]
  property backup_retention : Int32

  @[JSON::Field(key: "trustCgnatIpAddresses")]
  property trust_cgnat_ip_addresses : Bool

end
