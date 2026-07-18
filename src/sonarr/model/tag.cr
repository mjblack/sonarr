class Sonarr::Model::Tag < Sonarr::Model

  @[JSON::Field(key: "label")]
  property label : String

  @[JSON::Field(key: "id")]
  property id : Int32

end
