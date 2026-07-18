require "../spec_helper"

describe Sonarr::Model::TaskResource do
  it "parses an empty object (all properties optional)" do
    task = Sonarr::Model::TaskResource.from_json("{}")
    task.id.should be_nil
    task.name.should be_nil
    task.last_execution.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "name": "Test Task",
      "taskName": "TestTask",
      "interval": 60,
      "lastExecution": "2023-01-01T12:00:00Z",
      "lastStartTime": "2023-01-01T11:00:00Z",
      "lastDuration": "120",
      "nextExecution": "2023-01-01T13:00:00Z"
    })
    task = Sonarr::Model::TaskResource.from_json(json)
    task.id.should eq(1)
    task.name.should eq("Test Task")
    task.task_name.should eq("TestTask")
    task.interval.should eq(60)
    task.last_execution.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    task.last_start_time.should eq(Time.utc(2023, 1, 1, 11, 0, 0))
    task.last_duration.should eq("120")
    task.next_execution.should eq(Time.utc(2023, 1, 1, 13, 0, 0))
  end
end
