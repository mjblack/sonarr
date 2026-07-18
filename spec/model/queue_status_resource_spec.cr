require "../spec_helper"

describe Sonarr::Model::QueueStatusResource do
  it "parses an empty object (all properties optional)" do
    status = Sonarr::Model::QueueStatusResource.from_json("{}")
    status.id.should be_nil
    status.total_count.should be_nil
    status.errors.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "totalCount": 10,
      "count": 5,
      "unknownCount": 2,
      "errors": true,
      "warnings": false,
      "unknownErrors": false,
      "unknownWarnings": false
    })
    status = Sonarr::Model::QueueStatusResource.from_json(json)
    status.id.should eq(1)
    status.total_count.should eq(10)
    status.count.should eq(5)
    status.unknown_count.should eq(2)
    status.errors.should eq(true)
    status.warnings.should eq(false)
    status.unknown_errors.should eq(false)
    status.unknown_warnings.should eq(false)
  end
end
