require "../spec_helper"

describe Sonarr::Model::QueueStatusResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "totalCount": 10,
      "count": 5,
      "unknownCount": 2,
      "errors": 1,
      "warnings": 0,
      "unknownErrors": 0,
      "unknownWarnings": 0
    })
    status = Sonarr::Model::QueueStatusResource.from_json(json)
    status.id.should eq(1)
    status.total_count.should eq(10)
    status.count.should eq(5)
    status.unknown_count.should eq(2)
    status.errors.should eq(1)
    status.warnings.should eq(0)
    status.unknown_errors.should eq(0)
    status.unknown_warnings.should eq(0)
  end
end 