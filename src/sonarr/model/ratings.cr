class Sonarr::Model::Ratings < Sonarr::Model

  @[JSON::Field(key: "votes")]
  property votes : Int32

  @[JSON::Field(key: "value")]
  property value : Float64

end
