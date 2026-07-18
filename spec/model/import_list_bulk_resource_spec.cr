require "../spec_helper"

describe Sonarr::Model::ImportListBulkResource do
  it "parses JSON with all required fields" do
    json = %({
      "ids": [1, 2, 3],
      "tags": [1, 2],
      "applyTags": "add"
    })
    bulk = Sonarr::Model::ImportListBulkResource.from_json(json)
    bulk.ids.should eq([1, 2, 3])
    bulk.tags.should eq([1, 2])
    bulk.apply_tags.should eq(Sonarr::ApplyTags::Add)
  end
end 