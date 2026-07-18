require "../spec_helper"

describe Sonarr::Model::ImportListExclusionBulkResource do
  it "parses JSON with all required fields" do
    json = %({
      "ids": [1, 2, 3]
    })
    bulk = Sonarr::Model::ImportListExclusionBulkResource.from_json(json)
    bulk.ids.should eq([1, 2, 3])
  end
end 