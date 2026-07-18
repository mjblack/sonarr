require "../spec_helper"

describe Sonarr::Model::ImportListBulkResource do
  it "parses an empty object (arrays default to empty)" do
    bulk = Sonarr::Model::ImportListBulkResource.from_json("{}")
    bulk.ids.should be_empty
    bulk.tags.should be_empty
    bulk.apply_tags.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "ids": [1, 2, 3],
      "tags": [1, 2],
      "applyTags": "add",
      "rootFolderPath": "/tv",
      "qualityProfileId": 1
    })
    bulk = Sonarr::Model::ImportListBulkResource.from_json(json)
    bulk.ids.should eq([1, 2, 3])
    bulk.tags.should eq([1, 2])
    bulk.apply_tags.should eq(Sonarr::ApplyTags::Add)
    bulk.root_folder_path.should eq("/tv")
    bulk.quality_profile_id.should eq(1)
  end
end
