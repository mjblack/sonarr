class Sonarr::Model::BackupResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "path", emit_null: true)]
  property path : String?

  @[JSON::Field(key: "type")]
  property type : Sonarr::BackupType

  @[JSON::Field(key: "size")]
  property size : Int64

  @[JSON::Field(key: "time")]
  property time : String

end
