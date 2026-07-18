class Sonarr::Model::Quality < Sonarr::Model
  @[JSON::Field]
  property id : Int32

  @[JSON::Field(key: "name", emit_nil: true)]
  property name : String?

  @[JSON::Field(key: "source")]
  property source : Sonarr::QualitySource

  @[JSON::Field(key: "resolution")]
  property resolution : Int32
end
