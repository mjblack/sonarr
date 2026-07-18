require "../spec_helper"

describe Sonarr::Model::IndexerConfigResource do
  it "parses an empty object (all properties optional)" do
    config = Sonarr::Model::IndexerConfigResource.from_json("{}")
    config.id.should be_nil
    config.minimum_age.should be_nil
    config.rss_sync_interval.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "minimumAge": 0,
      "maximumSize": 0,
      "retention": 0,
      "rssSyncInterval": 15
    })
    config = Sonarr::Model::IndexerConfigResource.from_json(json)
    config.id.should eq(1)
    config.minimum_age.should eq(0)
    config.maximum_size.should eq(0)
    config.retention.should eq(0)
    config.rss_sync_interval.should eq(15)
  end
end
