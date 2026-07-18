require "../spec_helper"

describe Sonarr::Model::ImportListConfigResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "listSyncLevel": "keepAndTag",
      "listSyncTag": 1
    })
    config = Sonarr::Model::ImportListConfigResource.from_json(json)
    config.id.should eq(1)
    config.list_sync_level.should eq(Sonarr::ListSyncLevelType::KeepAndTag)
    config.list_sync_tag.should eq(1)
  end
end 