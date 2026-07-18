class Sonarr::Model::LogResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "time")]
  property time : String

  @[JSON::Field(key: "exception", emit_null: true)]
  property exception : String?

  @[JSON::Field(key: "exceptionType", emit_null: true)]
  property exception_type : String?

  @[JSON::Field(key: "level", emit_null: true)]
  property level : String?

  @[JSON::Field(key: "logger", emit_null: true)]
  property logger : String?

  @[JSON::Field(key: "message", emit_null: true)]
  property message : String?

  @[JSON::Field(key: "method", emit_null: true)]
  property method : String?

end
