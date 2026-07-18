class Sonarr::Model::AutoTaggingResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "name", emit_null: true)]
  property name : String?

  @[JSON::Field(key: "removeTagsAutomatically")]
  property? remove_tags_automatically : Bool

  @[JSON::Field(key: "tags", emit_null: true)]
  property tags = [] of Int32

  @[JSON::Field(key: "specifications", emit_null: true)]
  property specifications : Array(AutoTaggingSpecificationSchema)?

end
