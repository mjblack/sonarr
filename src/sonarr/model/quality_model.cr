class Sonarr::Model::QualityModel < Sonarr::Model
  @[JSON::Field]
  property quality : Quality

  @[JSON::Field]
  property revision : Revision

end
