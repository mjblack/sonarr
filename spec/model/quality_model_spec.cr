require "../spec_helper"

describe Sonarr::Model::QualityModel do
  it "parses an empty object (all properties optional)" do
    model = Sonarr::Model::QualityModel.from_json("{}")
    model.quality.should be_nil
    model.revision.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080},
      "revision": {"version": 1, "real": 0, "isRepack": false}
    })
    model = Sonarr::Model::QualityModel.from_json(json)
    quality = present(model.quality)
    quality.id.should eq(1)
    quality.source.should eq(Sonarr::QualitySource::Web)
    present(model.revision).version.should eq(1)
  end
end
