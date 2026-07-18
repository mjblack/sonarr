require "../spec_helper"

describe Sonarr::Model::LogResource do
  it "parses an empty object (all properties optional)" do
    log = Sonarr::Model::LogResource.from_json("{}")
    log.id.should be_nil
    log.time.should be_nil
    log.message.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "time": "2023-01-01T12:00:00Z",
      "level": "info",
      "logger": "TestLogger",
      "message": "Test log message",
      "exception": "Test exception",
      "exceptionType": "System.Exception"
    })
    log = Sonarr::Model::LogResource.from_json(json)
    log.id.should eq(1)
    log.time.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    log.level.should eq("info")
    log.logger.should eq("TestLogger")
    log.message.should eq("Test log message")
    log.exception.should eq("Test exception")
    log.exception_type.should eq("System.Exception")
  end
end
