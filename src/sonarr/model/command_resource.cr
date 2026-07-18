class Sonarr::Model::CommandResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "commandName", emit_null: true)]
  property command_name : String?

  @[JSON::Field(key: "message", emit_null: true)]
  property message : String?

  @[JSON::Field(key: "body")]
  property body : Command

  @[JSON::Field(key: "priority")]
  property priority : Sonarr::CommandPriority

  @[JSON::Field(key: "status")]
  property status : Sonarr::CommandStatus

  @[JSON::Field(key: "result")]
  property result : Sonarr::CommandResult

  @[JSON::Field(key: "queued")]
  property queued : String

  @[JSON::Field(key: "started", emit_null: true)]
  property started : String?

  @[JSON::Field(key: "ended", emit_null: true)]
  property ended : String?

  @[JSON::Field(key: "duration", emit_null: true)]
  property duration : String?

  @[JSON::Field(key: "exception", emit_null: true)]
  property exception : String?

  @[JSON::Field(key: "trigger")]
  property trigger : Sonarr::CommandTrigger

  @[JSON::Field(key: "clientUserAgent", emit_null: true)]
  property client_user_agent : String?

  @[JSON::Field(key: "stateChangeTime", emit_null: true)]
  property state_change_time : String?

  @[JSON::Field(key: "sendUpdatesToClient")]
  property send_updates_to_client : Bool

  @[JSON::Field(key: "updateScheduledTask", emit_null: true)]
  property update_scheduled_task : Bool?

  @[JSON::Field(key: "lastExecutionTime", emit_null: true)]
  property last_execution_time : String?

end
