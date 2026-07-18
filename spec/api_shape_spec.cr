require "./spec_helper"

# Offline compile/shape specs for the B2 pilot endpoint modules.
#
# These assert that the generated `Sonarr::Api::*` classes exist, wrap a
# `Sonarr::Client`, and expose the expected methods with signatures matching
# `ext/schema.json` (path params, typed body, query params, return type).
#
# No HTTP is performed: the `Sonarr::Client` constructor only parses config, and
# the actual request calls live in an `if false` block that the compiler still
# type-checks. Live request behaviour is covered by the B4 integration specs.
private def offline_client : Sonarr::Client
  Sonarr::Client.new("http://localhost:8989", "shape-spec-key")
end

describe Sonarr::Api::Tag do
  it "wraps a client and exposes the CRUD surface" do
    api = Sonarr::Api::Tag.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks against the schema signatures" do
    # Never executed (no network); compiled to verify arity + types.
    if false
      api = Sonarr::Api::Tag.new(offline_client)
      tag = Sonarr::Model::TagResource.from_json("{}")

      list : Array(Sonarr::Model::TagResource) = api.list
      one : Sonarr::Model::TagResource? = api.get(1)
      created : Sonarr::Model::TagResource? = api.create(tag)
      updated : Sonarr::Model::TagResource? = api.update("1", tag)
      removed : Nil = api.delete(1)

      {list, one, created, updated, removed}
    end
    true.should be_true
  end
end

describe Sonarr::Api::Queue do
  it "exposes list/delete/delete_bulk" do
    api = Sonarr::Api::Queue.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:delete).should be_true
    api.responds_to?(:delete_bulk).should be_true
  end

  it "type-checks paged list + query params + typed body" do
    if false
      api = Sonarr::Api::Queue.new(offline_client)
      bulk = Sonarr::Model::QueueBulkResource.from_json("{}")

      paged : Sonarr::Model::QueueResourcePagingResource? = api.list(page: 1, page_size: 20, sort_direction: Sonarr::SortDirection::Ascending,
        series_ids: [1, 2], status: [Sonarr::QueueStatus::Queued])
      removed : Nil = api.delete(5, remove_from_client: true, blocklist: false)
      removed_bulk : Nil = api.delete_bulk(bulk, remove_from_client: true)

      {paged, removed, removed_bulk}
    end
    true.should be_true
  end
end

describe Sonarr::Api::History do
  it "exposes the paged list and sub-resource getters" do
    api = Sonarr::Api::History.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:get_since).should be_true
    api.responds_to?(:get_series).should be_true
    api.responds_to?(:create_failed).should be_true
  end

  it "type-checks paged list + array-returning sub-resources" do
    if false
      api = Sonarr::Api::History.new(offline_client)

      paged : Sonarr::Model::HistoryResourcePagingResource? = api.list(page: 1)
      since : Array(Sonarr::Model::HistoryResource) = api.get_since(date: Time.utc)
      series : Array(Sonarr::Model::HistoryResource) = api.get_series(series_id: 3)
      failed : Nil = api.create_failed(9)

      {paged, since, series, failed}
    end
    true.should be_true
  end
end
