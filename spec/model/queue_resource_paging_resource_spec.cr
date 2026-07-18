require "../spec_helper"

describe Sonarr::Model::QueueResourcePagingResource do
  it "parses an empty object (records default to empty)" do
    paging = Sonarr::Model::QueueResourcePagingResource.from_json("{}")
    paging.page.should be_nil
    paging.records.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "page": 1,
      "pageSize": 10,
      "sortKey": "time",
      "sortDirection": "descending",
      "totalRecords": 100,
      "records": [{"id": 1, "series": #{SpecFixtures.series_json}, "episode": #{SpecFixtures.episode_json}, "quality": #{SpecFixtures.quality_model_json}, "size": 123456, "status": "queued"}]
    })
    paging = Sonarr::Model::QueueResourcePagingResource.from_json(json)
    paging.page.should eq(1)
    paging.page_size.should eq(10)
    paging.sort_key.should eq("time")
    paging.sort_direction.should eq(Sonarr::SortDirection::Descending)
    paging.total_records.should eq(100)
    paging.records.size.should eq(1)
    paging.records.first.status.should eq(Sonarr::QueueStatus::Queued)
  end
end
