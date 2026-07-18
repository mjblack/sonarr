class Sonarr::Model::Language < Sonarr::Model

  @[JSON::Field]
  property id : Int32

  @[JSON::Field(emit_nil: true)]
  property name : String?

end
