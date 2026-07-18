require "../spec_helper"

describe Sonarr::Model::LogResourcePagingResource do
  it "parses an empty object (records default to empty)" do
    paging = Sonarr::Model::LogResourcePagingResource.from_json("{}")
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
      "records": [{"id": 1, "time": "2023-01-01T12:00:00Z", "level": "info", "logger": "TestLogger", "message": "Test log message"}]
    })
    paging = Sonarr::Model::LogResourcePagingResource.from_json(json)
    paging.page.should eq(1)
    paging.page_size.should eq(10)
    paging.sort_key.should eq("time")
    paging.sort_direction.should eq(Sonarr::SortDirection::Descending)
    paging.total_records.should eq(100)
    paging.records.size.should eq(1)
    paging.records.first.message.should eq("Test log message")
  end
end
