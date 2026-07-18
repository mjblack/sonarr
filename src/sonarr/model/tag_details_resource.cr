class Sonarr::Model::TagDetailsResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "label", emit_null: true)]
  property label : String?

  @[JSON::Field(key: "delayProfileIds", emit_null: true)]
  property delay_profile_ids : Array(Int32)?

  @[JSON::Field(key: "importListIds", emit_null: true)]
  property import_list_ids : Array(Int32)?

  @[JSON::Field(key: "notificationIds", emit_null: true)]
  property notification_ids : Array(Int32)?

  @[JSON::Field(key: "restrictionIds", emit_null: true)]
  property restriction_ids : Array(Int32)?

  @[JSON::Field(key: "indexerIds", emit_null: true)]
  property indexer_ids : Array(Int32)?

  @[JSON::Field(key: "downloadClientIds", emit_null: true)]
  property download_client_ids : Array(Int32)?

  @[JSON::Field(key: "autoTagIds", emit_null: true)]
  property auto_tag_ids : Array(Int32)?

  @[JSON::Field(key: "seriesIds", emit_null: true)]
  property series_ids : Array(Int32)?

end
