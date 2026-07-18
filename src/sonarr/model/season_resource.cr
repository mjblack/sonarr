class Sonarr::Model::SeasonResource < Sonarr::Model

  @[JSON::Field(key: "seasonNumber")]
  property season_number : Int32

  @[JSON::Field(key: "monitored")]
  property? monitored : Bool

  @[JSON::Field(key: "statistics", emit_null: true)]
  property statistics : SeasonStatisticsResource?

  @[JSON::Field(key: "images", emit_null: true)]
  property images = [] of MediaCover
end
