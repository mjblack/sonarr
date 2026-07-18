require "../spec_helper"

describe Sonarr::Model::TagDetailsResource do
  it "parses an empty object (arrays default to empty)" do
    tag = Sonarr::Model::TagDetailsResource.from_json("{}")
    tag.id.should be_nil
    tag.label.should be_nil
    tag.series_ids.should be_empty
    tag.indexer_ids.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "label": "Test Tag",
      "delayProfileIds": [1, 2],
      "importListIds": [3, 4],
      "notificationIds": [5, 6],
      "restrictionIds": [7, 8],
      "indexerIds": [9, 10],
      "downloadClientIds": [11, 12],
      "autoTagIds": [13, 14],
      "seriesIds": [15, 16]
    })
    tag = Sonarr::Model::TagDetailsResource.from_json(json)
    tag.id.should eq(1)
    tag.label.should eq("Test Tag")
    tag.delay_profile_ids.should eq([1, 2])
    tag.import_list_ids.should eq([3, 4])
    tag.notification_ids.should eq([5, 6])
    tag.restriction_ids.should eq([7, 8])
    tag.indexer_ids.should eq([9, 10])
    tag.download_client_ids.should eq([11, 12])
    tag.auto_tag_ids.should eq([13, 14])
    tag.series_ids.should eq([15, 16])
  end
end
