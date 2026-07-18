class Sonarr::Model::QueueResourcePagingResource < Sonarr::Model

  @[JSON::Field(key: "page")]
  property page : Int32

  @[JSON::Field(key: "pageSize")]
  property page_size : Int32

  @[JSON::Field(key: "sortKey", emit_null: true)]
  property sort_key : String?

  @[JSON::Field(key: "sortDirection")]
  property sort_direction : Sonarr::SortDirection

  @[JSON::Field(key: "totalRecords")]
  property total_records : Int32

  @[JSON::Field(key: "records", emit_null: true)]
  property records : Array(QueueResource)?

end
