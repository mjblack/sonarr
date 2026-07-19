require "../integration_helper"

# Api::Series#list — a fresh Sonarr has no series added, so this returns an
# empty Array(Sonarr::Model::SeriesResource). Verifies the typed endpoint is
# reachable and deserializes cleanly without any external metadata/indexers.
describe "integration: Api::Series" do
  integration_it "#list returns an empty typed array on a bare instance" do
    series = Sonarr::Api::Series.new(IntegrationHelper.client).list
    series.should be_empty
  end
end
