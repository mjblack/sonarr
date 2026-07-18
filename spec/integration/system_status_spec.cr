require "../integration_helper"

# GET /api/v3/system/status — the most fundamental endpoint a bare Sonarr
# exposes. Asserts HTTP status + JSON shape, and additionally proves the
# clearly-stable Sonarr::Model::SystemResource deserializes against the live
# payload.
describe "integration: system/status" do
  integration_it "returns 200 with a well-formed status document" do
    resp = IntegrationHelper.get("/api/v3/system/status")
    resp.status_code.should eq(200)

    json = JSON.parse(resp.body)
    json["appName"].as_s.should eq("Sonarr")
    json["version"].as_s.should_not be_empty
    # A containerised Sonarr always reports these two.
    json["isDocker"].as_bool.should be_true
    json["isLinux"].as_bool.should be_true
  end

  integration_it "deserializes into the stable SystemResource model" do
    resp = IntegrationHelper.get("/api/v3/system/status")
    resp.status_code.should eq(200)

    status = Sonarr::Model::SystemResource.from_json(resp.body)
    status.app_name.should eq("Sonarr")
    status.version.should_not be_nil
    status.is_docker.should be_true
  end
end
