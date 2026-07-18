require "../spec_helper"

describe Sonarr::Model::IndexerConfigResource do
  it "parses JSON with all required fields" do
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