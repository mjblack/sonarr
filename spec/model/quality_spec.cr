require "../spec_helper"

describe Sonarr::Model::Quality do
  it "parses an empty object (all properties optional)" do
    quality = Sonarr::Model::Quality.from_json("{}")
    quality.id.should be_nil
    quality.name.should be_nil
    quality.source.should be_nil
    quality.resolution.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "name": "HDTV", "source": "web", "resolution": 1080})
    quality = Sonarr::Model::Quality.from_json(json)
    quality.id.should eq(1)
    quality.name.should eq("HDTV")
    quality.source.should eq(Sonarr::QualitySource::Web)
    quality.resolution.should eq(1080)
  end

  it "round-trips the source enum as camelCase" do
    quality = Sonarr::Model::Quality.from_json(%({"source": "webRip"}))
    quality.to_json.should contain(%("source":"webRip"))
    Sonarr::Model::Quality.from_json(quality.to_json).source
      .should eq(Sonarr::QualitySource::WebRip)
  end
end
