require "./spec_helper"

# The models are generated with every property nilable (no schema property is
# `required`), so an empty JSON object must parse for every model without
# raising. This is a broad smoke test proving the all-optional generation:
# scalars/objects default to nil, arrays default to empty.
describe "Model nullability" do
  it "parses \"{}\" for a representative set of models without raising" do
    parsers = [
      -> { Sonarr::Model::SeriesResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::SeasonResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::EpisodeResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::EpisodeFileResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::QueueResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::QueueResourcePagingResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::HistoryResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::CommandResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::Command.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::IndexerResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::ImportListResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::HostConfigResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::SystemResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::ManualImportResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::ManualImportReprocessResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::QualityModel.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::Quality.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::Field.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::TagResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::TagDetailsResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::LogResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::TaskResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::SeriesStatisticsResource.from_json("{}").as(Sonarr::Model) },
      -> { Sonarr::Model::SeasonStatisticsResource.from_json("{}").as(Sonarr::Model) },
    ]

    parsers.each do |parser|
      model = parser.call
      # A parsed-empty model re-serializes to valid JSON too.
      model.to_json.should be_a(String)
    end
  end

  it "round-trips an empty object back to JSON" do
    series = Sonarr::Model::SeriesResource.from_json("{}")
    Sonarr::Model::SeriesResource.from_json(series.to_json).id.should be_nil
  end
end
