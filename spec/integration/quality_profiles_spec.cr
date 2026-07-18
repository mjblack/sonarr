require "../integration_helper"

# GET /api/v3/qualityprofile — a bare Sonarr ships default quality profiles.
describe "integration: quality profiles" do
  integration_it "lists the default quality profiles" do
    resp = IntegrationHelper.get("/api/v3/qualityprofile")
    resp.status_code.should eq(200)

    arr = JSON.parse(resp.body).as_a
    arr.should_not be_empty
    # Each profile exposes at least an id and a name.
    first = arr.first
    first["id"].as_i.should be > 0
    first["name"].as_s.should_not be_empty
  end
end
