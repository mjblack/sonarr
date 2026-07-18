require "../spec_helper"

describe Sonarr::Model::LogResourcePagingResource do
  it "parses JSON with all required fields" do
    json = %({
      "page": 1,
      "pageSize": 10,
      "sortKey": "time",
      "sortDirection": "descending",
      "totalRecords": 100,
      "records": [{"id": 1, "time": "2023-01-01T12:00:00Z", "level": "info", "logger": "TestLogger", "message": "Test log message", "exception": "Test exception", "exceptionType": "System.Exception"}]
    })
    paging = Sonarr::Model::LogResourcePagingResource.from_json(json)
    paging.page.should eq(1)
    paging.page_size.should eq(10)
    paging.sort_key.should eq("time")
    paging.sort_direction.should eq(Sonarr::SortDirection::Descending)
    paging.total_records.should eq(100)
    paging.records.should be_a(Array(Sonarr::Model::LogResource))
  end
end 