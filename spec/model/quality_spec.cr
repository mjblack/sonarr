require "../spec_helper"

describe Sonarr::Model::Quality do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "name": "HDTV",
      "source": "web",
      "resolution": 1080
    })
    quality = Sonarr::Model::Quality.from_json(json)
    quality.id.should eq(1)
    quality.name.should eq("HDTV")
    quality.source.should eq(Sonarr::QualitySource::Web)
    quality.resolution.should eq(1080)
  end
end 