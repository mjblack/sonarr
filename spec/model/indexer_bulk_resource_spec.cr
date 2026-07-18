require "../spec_helper"

describe Sonarr::Model::IndexerBulkResource do
  it "parses an empty object (arrays default to empty)" do
    bulk = Sonarr::Model::IndexerBulkResource.from_json("{}")
    bulk.ids.should be_empty
    bulk.tags.should be_empty
    bulk.apply_tags.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "ids": [1, 2, 3],
      "tags": [1, 2],
      "applyTags": "add",
      "enableRss": true,
      "priority": 5
    })
    bulk = Sonarr::Model::IndexerBulkResource.from_json(json)
    bulk.ids.should eq([1, 2, 3])
    bulk.tags.should eq([1, 2])
    bulk.apply_tags.should eq(Sonarr::ApplyTags::Add)
    bulk.enable_rss.should eq(true)
    bulk.priority.should eq(5)
  end
end
