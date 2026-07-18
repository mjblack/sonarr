require "../spec_helper"

describe Sonarr::Model::ImportListExclusionResource do
  it "parses an empty object (all properties optional)" do
    exclusion = Sonarr::Model::ImportListExclusionResource.from_json("{}")
    exclusion.id.should be_nil
    exclusion.tvdb_id.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "tvdbId": 12345, "title": "Some Show"})
    exclusion = Sonarr::Model::ImportListExclusionResource.from_json(json)
    exclusion.id.should eq(1)
    exclusion.tvdb_id.should eq(12345)
    exclusion.title.should eq("Some Show")
  end
end
