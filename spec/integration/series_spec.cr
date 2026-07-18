require "../integration_helper"

# GET /api/v3/series — a fresh Sonarr has no series added, so this returns an
# empty JSON array. Verifies the endpoint is reachable and well-formed without
# needing any external metadata/indexers.
describe "integration: series list" do
  integration_it "returns an empty array on a bare instance" do
    resp = IntegrationHelper.get("/api/v3/series")
    resp.status_code.should eq(200)

    arr = JSON.parse(resp.body).as_a
    arr.should be_empty
  end
end
