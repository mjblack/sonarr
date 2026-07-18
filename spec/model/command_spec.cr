require "../spec_helper"

describe Sonarr::Model::Command do
  it "parses JSON with all required fields" do
    json = %({
      "sendUpdatesToClient": true,
      "updateScheduledTask": false,
      "completionMessage": "Done!",
      "requiresDiskAccess": true,
      "isExclusive": false,
      "isLongRunning": true,
      "name": "TestCommand",
      "lastExecutionTime": "2023-01-01T12:00:00Z",
      "lastStartTime": "2023-01-01T11:00:00Z",
      "trigger": "manual",
      "suppressMessages": false,
      "clientUserAgent": "SpecAgent"
    })
    cmd = Sonarr::Model::Command.from_json(json)
    cmd.send_updates_to_client.should eq(true)
    cmd.update_scheduled_task.should eq(false)
    cmd.completion_message.should eq("Done!")
    cmd.requires_disk_access.should eq(true)
    cmd.is_exclusive.should eq(false)
    cmd.is_long_running.should eq(true)
    cmd.name.should eq("TestCommand")
    cmd.last_execution_time.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    cmd.last_start_time.should eq(Time.utc(2023, 1, 1, 11, 0, 0))
    cmd.trigger.should eq(Sonarr::CommandTrigger::Manual)
    cmd.suppress_messages.should eq(false)
    cmd.client_user_agent.should eq("SpecAgent")
  end
end 