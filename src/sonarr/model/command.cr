class Sonarr::Model::Command < Sonarr::Model

  @[JSON::Field(key: "sendUpdatesToClient")]
  property send_updates_to_client : Bool

  @[JSON::Field(key: "updateScheduledTask")]
  property update_scheduled_task : Bool

  @[JSON::Field(key: "completionMessage", emit_null: true)]
  property completion_message : String?

  @[JSON::Field(key: "requiresDiskAccess")]
  property requires_disk_access : Bool

  @[JSON::Field(key: "isExclusive")]
  property is_exclusive : Bool

  @[JSON::Field(key: "isLongRunning")]
  property is_long_running : Bool

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "lastExecutionTime", emit_null: true)]
  property last_execution_time : Time?

  @[JSON::Field(key: "lastStartTime", emit_null: true)]
  property last_start_time : Time?

  @[JSON::Field(key: "trigger")]
  property trigger : Sonarr::CommandTrigger

  @[JSON::Field(key: "suppressMessages")]
  property suppress_messages : Bool

  @[JSON::Field(key: "clientUserAgent", emit_null: true)]
  property client_user_agent : String?

end
