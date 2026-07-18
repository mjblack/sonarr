class Sonarr::Model::TaskResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "taskName", emit_null: true)]
  property task_name : String?

  @[JSON::Field(key: "interval")]
  property interval : Int32

  @[JSON::Field(key: "lastExecution")]
  property last_execution : Time

  @[JSON::Field(key: "lastStartTime")]
  property last_start_time : Time

  @[JSON::Field(key: "nextExecution")]
  property next_execution : Time

  @[JSON::Field(key: "lastDuration", emit_null: true)]
  property last_duration : String?

end
