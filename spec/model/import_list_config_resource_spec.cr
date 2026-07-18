require "../spec_helper"

describe Sonarr::Model::ImportListConfigResource do
  it "parses an empty object (all properties optional)" do
    config = Sonarr::Model::ImportListConfigResource.from_json("{}")
    config.id.should be_nil
    config.list_sync_level.should be_nil
    config.list_sync_tag.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "listSyncLevel": "keepAndTag", "listSyncTag": 1})
    config = Sonarr::Model::ImportListConfigResource.from_json(json)
    config.id.should eq(1)
    config.list_sync_level.should eq(Sonarr::ListSyncLevelType::KeepAndTag)
    config.list_sync_tag.should eq(1)
  end
end
