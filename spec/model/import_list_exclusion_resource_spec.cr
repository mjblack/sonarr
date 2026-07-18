require "../spec_helper"

describe Sonarr::Model::ImportListExclusionResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "tvdbId": 12345
    })
    exclusion = Sonarr::Model::ImportListExclusionResource.from_json(json)
    exclusion.id.should eq(1)
    exclusion.tvdb_id.should eq(12345)
  end
end 