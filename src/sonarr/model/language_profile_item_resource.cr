class Sonarr::Model::LanguageProfileItemResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "language")]
  property language : Language

  @[JSON::Field(key: "allowed")]
  property allowed : Bool

end
