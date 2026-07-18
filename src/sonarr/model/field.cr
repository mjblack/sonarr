class Sonarr::Model::Field < Sonarr::Model

  @[JSON::Field(key: "order")]
  property order : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String

  @[JSON::Field(key: "label", emit_null: true)]
  property label : String

  @[JSON::Field(key: "unit", emit_null: true)]
  property unit : String

  @[JSON::Field(key: "helpText", emit_null: true)]
  property help_text : String

  @[JSON::Field(key: "helpTextWarning", emit_null: true)]
  property help_text_warning : String

  @[JSON::Field(key: "helpLink", emit_null: true)]
  property help_link : String

  @[JSON::Field(key: "value", emit_null: true)]
  property value : JSON::Any

  @[JSON::Field(key: "type", emit_null: true)]
  property type : String

  @[JSON::Field(key: "advanced")]
  property advanced : Bool

  @[JSON::Field(key: "selectOptions", emit_null: true)]
  property select_options = [] of SelectOption

  @[JSON::Field(key: "selectOptionsProviderAction", emit_null: true)]
  property select_options_provider_action : String

  @[JSON::Field(key: "section", emit_null: true)]
  property section : String

  @[JSON::Field(key: "hidden", emit_null: true)]
  property hidden : String

  @[JSON::Field(key: "privacy")]
  property privacy : PrivacyLevel

  @[JSON::Field(key: "placeholder", emit_null: true)]
  property placeholder : String

  @[JSON::Field(key: "isFloat")]
  property is_float : Bool

end
