require "../spec_helper"

describe Sonarr::Model::ImportListExclusionBulkResource do
  it "parses an empty object (arrays default to empty)" do
    bulk = Sonarr::Model::ImportListExclusionBulkResource.from_json("{}")
    bulk.ids.should be_empty
  end

  it "parses a fully-populated object" do
    bulk = Sonarr::Model::ImportListExclusionBulkResource.from_json(%({"ids": [1, 2, 3]}))
    bulk.ids.should eq([1, 2, 3])
  end
end
