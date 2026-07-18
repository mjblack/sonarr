class Sonarr::Model::Revision < Sonarr::Model
  @[JSON::Field]
  property version : Int32

  @[JSON::Field(key: "real")]
  property real : Int32

  @[JSON::Field(key: "isRepack")]
  property? is_repack : Bool
end
