class Sonarr::Model::LanguageProfileResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "upgradeAllowed")]
  property upgrade_allowed : Bool

  @[JSON::Field(key: "cutoff")]
  property cutoff : Language

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(LanguageProfileItemResource)?

end
