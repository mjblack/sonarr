require "./spec_helper"

# AUTO-GENERATED SHAPE SPEC — offline compile/shape coverage for every
# generated `Sonarr::Api::*` endpoint module (B3, all groups).
#
# For each group this asserts (a) the class wraps a `Sonarr::Client` and
# `responds_to?` each generated method, and (b) a load-bearing typed-local
# compile check per method inside an `if false` block. The `if false` body is
# never executed (no network) but IS semantically analyzed, so every method's
# arity, argument types and declared return type are verified against
# `ext/schema.json`. Required args (path ids, request bodies) are synthesized;
# optional query params are omitted. Live behaviour is covered by integration.
#
# Regenerate by re-running the B3 spec generator after `tools/generate.cr`.
private def offline_client : Sonarr::Client
  Sonarr::Client.new("http://localhost:8989", "shape-spec-key")
end

describe Sonarr::Api::ApiInfo do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ApiInfo.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ApiInfo.new(offline_client)
      _r1 : Nil = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::Authentication do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Authentication.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Authentication.new(offline_client)
      _r1 : Nil = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::AutoTagging do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::AutoTagging.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::AutoTagging.new(offline_client)
      _r1 : Array(Sonarr::Model::AutoTaggingResource) = api.list
      _r2 : Sonarr::Model::AutoTaggingResource? = api.create(Sonarr::Model::AutoTaggingResource.from_json("{}"))
      _r3 : Nil = api.list_schema
      _r4 : Sonarr::Model::AutoTaggingResource? = api.get(1)
      _r5 : Sonarr::Model::AutoTaggingResource? = api.update(1, Sonarr::Model::AutoTaggingResource.from_json("{}"))
      _r6 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Backup do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Backup.new(offline_client)
    api.responds_to?(:list_backup).should be_true
    api.responds_to?(:create_backup_restore_upload).should be_true
    api.responds_to?(:create_backup_restore).should be_true
    api.responds_to?(:delete_backup).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Backup.new(offline_client)
      _r1 : Array(Sonarr::Model::BackupResource) = api.list_backup
      _r2 : Nil = api.create_backup_restore_upload
      _r3 : Nil = api.create_backup_restore(1)
      _r4 : Nil = api.delete_backup(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Blocklist do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Blocklist.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Blocklist.new(offline_client)
      _r1 : Sonarr::Model::BlocklistResourcePagingResource? = api.list
      _r2 : Nil = api.delete_bulk(Sonarr::Model::BlocklistBulkResource.from_json("{}"))
      _r3 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Calendar do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Calendar.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:get).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Calendar.new(offline_client)
      _r1 : Array(Sonarr::Model::EpisodeResource) = api.list
      _r2 : Sonarr::Model::EpisodeResource? = api.get(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Command do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Command.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Command.new(offline_client)
      _r1 : Array(Sonarr::Model::CommandResource) = api.list
      _r2 : Sonarr::Model::CommandResource? = api.create(Sonarr::Model::CommandResource.from_json("{}"))
      _r3 : Sonarr::Model::CommandResource? = api.get(1)
      _r4 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::CustomFilter do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::CustomFilter.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::CustomFilter.new(offline_client)
      _r1 : Array(Sonarr::Model::CustomFilterResource) = api.list
      _r2 : Sonarr::Model::CustomFilterResource? = api.create(Sonarr::Model::CustomFilterResource.from_json("{}"))
      _r3 : Sonarr::Model::CustomFilterResource? = api.get(1)
      _r4 : Sonarr::Model::CustomFilterResource? = api.update(1, Sonarr::Model::CustomFilterResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::CustomFormat do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::CustomFormat.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:update_bulk).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::CustomFormat.new(offline_client)
      _r1 : Array(Sonarr::Model::CustomFormatResource) = api.list
      _r2 : Sonarr::Model::CustomFormatResource? = api.create(Sonarr::Model::CustomFormatResource.from_json("{}"))
      _r3 : Sonarr::Model::CustomFormatResource? = api.update_bulk(Sonarr::Model::CustomFormatBulkResource.from_json("{}"))
      _r4 : Nil = api.delete_bulk(Sonarr::Model::CustomFormatBulkResource.from_json("{}"))
      _r5 : Nil = api.list_schema
      _r6 : Sonarr::Model::CustomFormatResource? = api.get(1)
      _r7 : Sonarr::Model::CustomFormatResource? = api.update(1, Sonarr::Model::CustomFormatResource.from_json("{}"))
      _r8 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Cutoff do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Cutoff.new(offline_client)
    api.responds_to?(:list_cutoff).should be_true
    api.responds_to?(:get_cutoff).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Cutoff.new(offline_client)
      _r1 : Sonarr::Model::EpisodeResourcePagingResource? = api.list_cutoff
      _r2 : Sonarr::Model::EpisodeResource? = api.get_cutoff(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::DelayProfile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::DelayProfile.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:update_reorder).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::DelayProfile.new(offline_client)
      _r1 : Array(Sonarr::Model::DelayProfileResource) = api.list
      _r2 : Sonarr::Model::DelayProfileResource? = api.create(Sonarr::Model::DelayProfileResource.from_json("{}"))
      _r3 : Array(Sonarr::Model::DelayProfileResource) = api.update_reorder(1)
      _r4 : Sonarr::Model::DelayProfileResource? = api.get(1)
      _r5 : Sonarr::Model::DelayProfileResource? = api.update(1, Sonarr::Model::DelayProfileResource.from_json("{}"))
      _r6 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::DiskSpace do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::DiskSpace.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::DiskSpace.new(offline_client)
      _r1 : Array(Sonarr::Model::DiskSpaceResource) = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::DownloadClient do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::DownloadClient.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:create_action).should be_true
    api.responds_to?(:update_bulk).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:create_test).should be_true
    api.responds_to?(:create_testall).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::DownloadClient.new(offline_client)
      _r1 : Array(Sonarr::Model::DownloadClientResource) = api.list
      _r2 : Sonarr::Model::DownloadClientResource? = api.create(Sonarr::Model::DownloadClientResource.from_json("{}"))
      _r3 : Nil = api.create_action("x", Sonarr::Model::DownloadClientResource.from_json("{}"))
      _r4 : Sonarr::Model::DownloadClientResource? = api.update_bulk(Sonarr::Model::DownloadClientBulkResource.from_json("{}"))
      _r5 : Nil = api.delete_bulk(Sonarr::Model::DownloadClientBulkResource.from_json("{}"))
      _r6 : Array(Sonarr::Model::DownloadClientResource) = api.list_schema
      _r7 : Nil = api.create_test(Sonarr::Model::DownloadClientResource.from_json("{}"))
      _r8 : Nil = api.create_testall
      _r9 : Sonarr::Model::DownloadClientResource? = api.get(1)
      _r10 : Sonarr::Model::DownloadClientResource? = api.update(1, Sonarr::Model::DownloadClientResource.from_json("{}"))
      _r11 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::DownloadClientConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::DownloadClientConfig.new(offline_client)
    api.responds_to?(:list_downloadclient).should be_true
    api.responds_to?(:get_downloadclient).should be_true
    api.responds_to?(:update_downloadclient).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::DownloadClientConfig.new(offline_client)
      _r1 : Sonarr::Model::DownloadClientConfigResource? = api.list_downloadclient
      _r2 : Sonarr::Model::DownloadClientConfigResource? = api.get_downloadclient(1)
      _r3 : Sonarr::Model::DownloadClientConfigResource? = api.update_downloadclient(1, Sonarr::Model::DownloadClientConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::Episode do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Episode.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:update_monitor).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Episode.new(offline_client)
      _r1 : Array(Sonarr::Model::EpisodeResource) = api.list
      _r2 : Nil = api.update_monitor(Sonarr::Model::EpisodesMonitoredResource.from_json("{}"))
      _r3 : Sonarr::Model::EpisodeResource? = api.get(1)
      _r4 : Sonarr::Model::EpisodeResource? = api.update(1, Sonarr::Model::EpisodeResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::EpisodeFile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::EpisodeFile.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:update_bulk).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:update_editor).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::EpisodeFile.new(offline_client)
      _r1 : Array(Sonarr::Model::EpisodeFileResource) = api.list
      _r2 : Nil = api.update_bulk(Array(Sonarr::Model::EpisodeFileResource).new)
      _r3 : Nil = api.delete_bulk(Sonarr::Model::EpisodeFileListResource.from_json("{}"))
      _r4 : Nil = api.update_editor(Sonarr::Model::EpisodeFileListResource.from_json("{}"))
      _r5 : Sonarr::Model::EpisodeFileResource? = api.get(1)
      _r6 : Sonarr::Model::EpisodeFileResource? = api.update(1, Sonarr::Model::EpisodeFileResource.from_json("{}"))
      _r7 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::FileSystem do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::FileSystem.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:list_mediafiles).should be_true
    api.responds_to?(:list_type).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::FileSystem.new(offline_client)
      _r1 : Nil = api.list
      _r2 : Nil = api.list_mediafiles
      _r3 : Nil = api.list_type
    end
    true.should be_true
  end
end

describe Sonarr::Api::Health do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Health.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Health.new(offline_client)
      _r1 : Array(Sonarr::Model::HealthResource) = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::History do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::History.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create_failed).should be_true
    api.responds_to?(:list_series).should be_true
    api.responds_to?(:list_since).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::History.new(offline_client)
      _r1 : Sonarr::Model::HistoryResourcePagingResource? = api.list
      _r2 : Nil = api.create_failed(1)
      _r3 : Array(Sonarr::Model::HistoryResource) = api.list_series
      _r4 : Array(Sonarr::Model::HistoryResource) = api.list_since
    end
    true.should be_true
  end
end

describe Sonarr::Api::HostConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::HostConfig.new(offline_client)
    api.responds_to?(:list_host).should be_true
    api.responds_to?(:get_host).should be_true
    api.responds_to?(:update_host).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::HostConfig.new(offline_client)
      _r1 : Sonarr::Model::HostConfigResource? = api.list_host
      _r2 : Sonarr::Model::HostConfigResource? = api.get_host(1)
      _r3 : Sonarr::Model::HostConfigResource? = api.update_host(1, Sonarr::Model::HostConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::ImportList do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ImportList.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:create_action).should be_true
    api.responds_to?(:update_bulk).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:create_test).should be_true
    api.responds_to?(:create_testall).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ImportList.new(offline_client)
      _r1 : Array(Sonarr::Model::ImportListResource) = api.list
      _r2 : Sonarr::Model::ImportListResource? = api.create(Sonarr::Model::ImportListResource.from_json("{}"))
      _r3 : Nil = api.create_action("x", Sonarr::Model::ImportListResource.from_json("{}"))
      _r4 : Sonarr::Model::ImportListResource? = api.update_bulk(Sonarr::Model::ImportListBulkResource.from_json("{}"))
      _r5 : Nil = api.delete_bulk(Sonarr::Model::ImportListBulkResource.from_json("{}"))
      _r6 : Array(Sonarr::Model::ImportListResource) = api.list_schema
      _r7 : Nil = api.create_test(Sonarr::Model::ImportListResource.from_json("{}"))
      _r8 : Nil = api.create_testall
      _r9 : Sonarr::Model::ImportListResource? = api.get(1)
      _r10 : Sonarr::Model::ImportListResource? = api.update(1, Sonarr::Model::ImportListResource.from_json("{}"))
      _r11 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::ImportListConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ImportListConfig.new(offline_client)
    api.responds_to?(:list_importlist).should be_true
    api.responds_to?(:get_importlist).should be_true
    api.responds_to?(:update_importlist).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ImportListConfig.new(offline_client)
      _r1 : Sonarr::Model::ImportListConfigResource? = api.list_importlist
      _r2 : Sonarr::Model::ImportListConfigResource? = api.get_importlist(1)
      _r3 : Sonarr::Model::ImportListConfigResource? = api.update_importlist(1, Sonarr::Model::ImportListConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::ImportListExclusion do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ImportListExclusion.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:list_paged).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ImportListExclusion.new(offline_client)
      _r1 : Array(Sonarr::Model::ImportListExclusionResource) = api.list
      _r2 : Sonarr::Model::ImportListExclusionResource? = api.create(Sonarr::Model::ImportListExclusionResource.from_json("{}"))
      _r3 : Nil = api.delete_bulk(Sonarr::Model::ImportListExclusionBulkResource.from_json("{}"))
      _r4 : Sonarr::Model::ImportListExclusionResourcePagingResource? = api.list_paged
      _r5 : Sonarr::Model::ImportListExclusionResource? = api.get(1)
      _r6 : Sonarr::Model::ImportListExclusionResource? = api.update(1, Sonarr::Model::ImportListExclusionResource.from_json("{}"))
      _r7 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Indexer do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Indexer.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:create_action).should be_true
    api.responds_to?(:update_bulk).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:create_test).should be_true
    api.responds_to?(:create_testall).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Indexer.new(offline_client)
      _r1 : Array(Sonarr::Model::IndexerResource) = api.list
      _r2 : Sonarr::Model::IndexerResource? = api.create(Sonarr::Model::IndexerResource.from_json("{}"))
      _r3 : Nil = api.create_action("x", Sonarr::Model::IndexerResource.from_json("{}"))
      _r4 : Sonarr::Model::IndexerResource? = api.update_bulk(Sonarr::Model::IndexerBulkResource.from_json("{}"))
      _r5 : Nil = api.delete_bulk(Sonarr::Model::IndexerBulkResource.from_json("{}"))
      _r6 : Array(Sonarr::Model::IndexerResource) = api.list_schema
      _r7 : Nil = api.create_test(Sonarr::Model::IndexerResource.from_json("{}"))
      _r8 : Nil = api.create_testall
      _r9 : Sonarr::Model::IndexerResource? = api.get(1)
      _r10 : Sonarr::Model::IndexerResource? = api.update(1, Sonarr::Model::IndexerResource.from_json("{}"))
      _r11 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::IndexerConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::IndexerConfig.new(offline_client)
    api.responds_to?(:list_indexer).should be_true
    api.responds_to?(:get_indexer).should be_true
    api.responds_to?(:update_indexer).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::IndexerConfig.new(offline_client)
      _r1 : Sonarr::Model::IndexerConfigResource? = api.list_indexer
      _r2 : Sonarr::Model::IndexerConfigResource? = api.get_indexer(1)
      _r3 : Sonarr::Model::IndexerConfigResource? = api.update_indexer(1, Sonarr::Model::IndexerConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::IndexerFlag do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::IndexerFlag.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::IndexerFlag.new(offline_client)
      _r1 : Array(Sonarr::Model::IndexerFlagResource) = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::Language do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Language.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:get).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Language.new(offline_client)
      _r1 : Array(Sonarr::Model::LanguageResource) = api.list
      _r2 : Sonarr::Model::LanguageResource? = api.get(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::LanguageProfile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::LanguageProfile.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::LanguageProfile.new(offline_client)
      _r1 : Array(Sonarr::Model::LanguageProfileResource) = api.list
      _r2 : Sonarr::Model::LanguageProfileResource? = api.create(Sonarr::Model::LanguageProfileResource.from_json("{}"))
      _r3 : Sonarr::Model::LanguageProfileResource? = api.get(1)
      _r4 : Sonarr::Model::LanguageProfileResource? = api.update(1, Sonarr::Model::LanguageProfileResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::LanguageProfileSchema do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::LanguageProfileSchema.new(offline_client)
    api.responds_to?(:list_schema).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::LanguageProfileSchema.new(offline_client)
      _r1 : Sonarr::Model::LanguageProfileResource? = api.list_schema
    end
    true.should be_true
  end
end

describe Sonarr::Api::Localization do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Localization.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:list_language).should be_true
    api.responds_to?(:get).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Localization.new(offline_client)
      _r1 : Sonarr::Model::LocalizationResource? = api.list
      _r2 : Sonarr::Model::LocalizationLanguageResource? = api.list_language
      _r3 : Sonarr::Model::LocalizationResource? = api.get(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Log do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Log.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Log.new(offline_client)
      _r1 : Sonarr::Model::LogResourcePagingResource? = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::LogFile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::LogFile.new(offline_client)
    api.responds_to?(:list_file).should be_true
    api.responds_to?(:get_file).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::LogFile.new(offline_client)
      _r1 : Array(Sonarr::Model::LogFileResource) = api.list_file
      _r2 : Nil = api.get_file("x")
    end
    true.should be_true
  end
end

describe Sonarr::Api::ManualImport do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ManualImport.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ManualImport.new(offline_client)
      _r1 : Array(Sonarr::Model::ManualImportResource) = api.list
      _r2 : Nil = api.create(Array(Sonarr::Model::ManualImportReprocessResource).new)
    end
    true.should be_true
  end
end

describe Sonarr::Api::MediaManagementConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::MediaManagementConfig.new(offline_client)
    api.responds_to?(:list_mediamanagement).should be_true
    api.responds_to?(:get_mediamanagement).should be_true
    api.responds_to?(:update_mediamanagement).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::MediaManagementConfig.new(offline_client)
      _r1 : Sonarr::Model::MediaManagementConfigResource? = api.list_mediamanagement
      _r2 : Sonarr::Model::MediaManagementConfigResource? = api.get_mediamanagement(1)
      _r3 : Sonarr::Model::MediaManagementConfigResource? = api.update_mediamanagement(1, Sonarr::Model::MediaManagementConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::Metadata do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Metadata.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:create_action).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:create_test).should be_true
    api.responds_to?(:create_testall).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Metadata.new(offline_client)
      _r1 : Array(Sonarr::Model::MetadataResource) = api.list
      _r2 : Sonarr::Model::MetadataResource? = api.create(Sonarr::Model::MetadataResource.from_json("{}"))
      _r3 : Nil = api.create_action("x", Sonarr::Model::MetadataResource.from_json("{}"))
      _r4 : Array(Sonarr::Model::MetadataResource) = api.list_schema
      _r5 : Nil = api.create_test(Sonarr::Model::MetadataResource.from_json("{}"))
      _r6 : Nil = api.create_testall
      _r7 : Sonarr::Model::MetadataResource? = api.get(1)
      _r8 : Sonarr::Model::MetadataResource? = api.update(1, Sonarr::Model::MetadataResource.from_json("{}"))
      _r9 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Missing do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Missing.new(offline_client)
    api.responds_to?(:list_missing).should be_true
    api.responds_to?(:get_missing).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Missing.new(offline_client)
      _r1 : Sonarr::Model::EpisodeResourcePagingResource? = api.list_missing
      _r2 : Sonarr::Model::EpisodeResource? = api.get_missing(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::NamingConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::NamingConfig.new(offline_client)
    api.responds_to?(:list_naming).should be_true
    api.responds_to?(:list_naming_examples).should be_true
    api.responds_to?(:get_naming).should be_true
    api.responds_to?(:update_naming).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::NamingConfig.new(offline_client)
      _r1 : Sonarr::Model::NamingConfigResource? = api.list_naming
      _r2 : Nil = api.list_naming_examples
      _r3 : Sonarr::Model::NamingConfigResource? = api.get_naming(1)
      _r4 : Sonarr::Model::NamingConfigResource? = api.update_naming(1, Sonarr::Model::NamingConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::Notification do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Notification.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:create_action).should be_true
    api.responds_to?(:list_schema).should be_true
    api.responds_to?(:create_test).should be_true
    api.responds_to?(:create_testall).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Notification.new(offline_client)
      _r1 : Array(Sonarr::Model::NotificationResource) = api.list
      _r2 : Sonarr::Model::NotificationResource? = api.create(Sonarr::Model::NotificationResource.from_json("{}"))
      _r3 : Nil = api.create_action("x", Sonarr::Model::NotificationResource.from_json("{}"))
      _r4 : Array(Sonarr::Model::NotificationResource) = api.list_schema
      _r5 : Nil = api.create_test(Sonarr::Model::NotificationResource.from_json("{}"))
      _r6 : Nil = api.create_testall
      _r7 : Sonarr::Model::NotificationResource? = api.get(1)
      _r8 : Sonarr::Model::NotificationResource? = api.update(1, Sonarr::Model::NotificationResource.from_json("{}"))
      _r9 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Parse do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Parse.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Parse.new(offline_client)
      _r1 : Sonarr::Model::ParseResource? = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::Ping do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Ping.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Ping.new(offline_client)
      _r1 : Sonarr::Model::PingResource? = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::QualityDefinition do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QualityDefinition.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:list_limits).should be_true
    api.responds_to?(:update_update).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QualityDefinition.new(offline_client)
      _r1 : Array(Sonarr::Model::QualityDefinitionResource) = api.list
      _r2 : Sonarr::Model::QualityDefinitionLimitsResource? = api.list_limits
      _r3 : Nil = api.update_update(Array(Sonarr::Model::QualityDefinitionResource).new)
      _r4 : Sonarr::Model::QualityDefinitionResource? = api.get(1)
      _r5 : Sonarr::Model::QualityDefinitionResource? = api.update(1, Sonarr::Model::QualityDefinitionResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::QualityProfile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QualityProfile.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QualityProfile.new(offline_client)
      _r1 : Array(Sonarr::Model::QualityProfileResource) = api.list
      _r2 : Sonarr::Model::QualityProfileResource? = api.create(Sonarr::Model::QualityProfileResource.from_json("{}"))
      _r3 : Sonarr::Model::QualityProfileResource? = api.get(1)
      _r4 : Sonarr::Model::QualityProfileResource? = api.update(1, Sonarr::Model::QualityProfileResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::QualityProfileSchema do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QualityProfileSchema.new(offline_client)
    api.responds_to?(:list_schema).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QualityProfileSchema.new(offline_client)
      _r1 : Sonarr::Model::QualityProfileResource? = api.list_schema
    end
    true.should be_true
  end
end

describe Sonarr::Api::Queue do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Queue.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:delete_bulk).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Queue.new(offline_client)
      _r1 : Sonarr::Model::QueueResourcePagingResource? = api.list
      _r2 : Nil = api.delete_bulk(Sonarr::Model::QueueBulkResource.from_json("{}"))
      _r3 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::QueueAction do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QueueAction.new(offline_client)
    api.responds_to?(:create_grab_bulk).should be_true
    api.responds_to?(:create_grab).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QueueAction.new(offline_client)
      _r1 : Nil = api.create_grab_bulk(Sonarr::Model::QueueBulkResource.from_json("{}"))
      _r2 : Nil = api.create_grab(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::QueueDetails do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QueueDetails.new(offline_client)
    api.responds_to?(:list_details).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QueueDetails.new(offline_client)
      _r1 : Array(Sonarr::Model::QueueResource) = api.list_details
    end
    true.should be_true
  end
end

describe Sonarr::Api::QueueStatus do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::QueueStatus.new(offline_client)
    api.responds_to?(:list_status).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::QueueStatus.new(offline_client)
      _r1 : Sonarr::Model::QueueStatusResource? = api.list_status
    end
    true.should be_true
  end
end

describe Sonarr::Api::Release do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Release.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Release.new(offline_client)
      _r1 : Array(Sonarr::Model::ReleaseResource) = api.list
      _r2 : Nil = api.create(Sonarr::Model::ReleaseResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::ReleaseProfile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ReleaseProfile.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ReleaseProfile.new(offline_client)
      _r1 : Array(Sonarr::Model::ReleaseProfileResource) = api.list
      _r2 : Sonarr::Model::ReleaseProfileResource? = api.create(Sonarr::Model::ReleaseProfileResource.from_json("{}"))
      _r3 : Sonarr::Model::ReleaseProfileResource? = api.get(1)
      _r4 : Sonarr::Model::ReleaseProfileResource? = api.update(1, Sonarr::Model::ReleaseProfileResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::ReleasePush do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::ReleasePush.new(offline_client)
    api.responds_to?(:create_push).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::ReleasePush.new(offline_client)
      _r1 : Array(Sonarr::Model::ReleaseResource) = api.create_push(Sonarr::Model::ReleaseResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::RemotePathMapping do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::RemotePathMapping.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::RemotePathMapping.new(offline_client)
      _r1 : Array(Sonarr::Model::RemotePathMappingResource) = api.list
      _r2 : Sonarr::Model::RemotePathMappingResource? = api.create(Sonarr::Model::RemotePathMappingResource.from_json("{}"))
      _r3 : Sonarr::Model::RemotePathMappingResource? = api.get(1)
      _r4 : Sonarr::Model::RemotePathMappingResource? = api.update(1, Sonarr::Model::RemotePathMappingResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::RenameEpisode do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::RenameEpisode.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::RenameEpisode.new(offline_client)
      _r1 : Array(Sonarr::Model::RenameEpisodeResource) = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::RootFolder do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::RootFolder.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::RootFolder.new(offline_client)
      _r1 : Array(Sonarr::Model::RootFolderResource) = api.list
      _r2 : Sonarr::Model::RootFolderResource? = api.create(Sonarr::Model::RootFolderResource.from_json("{}"))
      _r3 : Sonarr::Model::RootFolderResource? = api.get(1)
      _r4 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::SeasonPass do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::SeasonPass.new(offline_client)
    api.responds_to?(:create).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::SeasonPass.new(offline_client)
      _r1 : Nil = api.create(Sonarr::Model::SeasonPassResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::Series do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Series.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Series.new(offline_client)
      _r1 : Array(Sonarr::Model::SeriesResource) = api.list
      _r2 : Sonarr::Model::SeriesResource? = api.create(Sonarr::Model::SeriesResource.from_json("{}"))
      _r3 : Sonarr::Model::SeriesResource? = api.get(1)
      _r4 : Sonarr::Model::SeriesResource? = api.update(1, Sonarr::Model::SeriesResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::SeriesEditor do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::SeriesEditor.new(offline_client)
    api.responds_to?(:update_editor).should be_true
    api.responds_to?(:delete_editor).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::SeriesEditor.new(offline_client)
      _r1 : Nil = api.update_editor(Sonarr::Model::SeriesEditorResource.from_json("{}"))
      _r2 : Nil = api.delete_editor(Sonarr::Model::SeriesEditorResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::SeriesFolder do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::SeriesFolder.new(offline_client)
    api.responds_to?(:list_folder).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::SeriesFolder.new(offline_client)
      _r1 : Nil = api.list_folder(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::SeriesImport do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::SeriesImport.new(offline_client)
    api.responds_to?(:create_import).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::SeriesImport.new(offline_client)
      _r1 : Nil = api.create_import(Array(Sonarr::Model::SeriesResource).new)
    end
    true.should be_true
  end
end

describe Sonarr::Api::SeriesLookup do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::SeriesLookup.new(offline_client)
    api.responds_to?(:list_lookup).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::SeriesLookup.new(offline_client)
      _r1 : Array(Sonarr::Model::SeriesResource) = api.list_lookup
    end
    true.should be_true
  end
end

describe Sonarr::Api::System do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::System.new(offline_client)
    api.responds_to?(:create_restart).should be_true
    api.responds_to?(:list_routes).should be_true
    api.responds_to?(:list_routes_duplicate).should be_true
    api.responds_to?(:create_shutdown).should be_true
    api.responds_to?(:list_status).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::System.new(offline_client)
      _r1 : Nil = api.create_restart
      _r2 : Nil = api.list_routes
      _r3 : Nil = api.list_routes_duplicate
      _r4 : Nil = api.create_shutdown
      _r5 : Sonarr::Model::SystemResource? = api.list_status
    end
    true.should be_true
  end
end

describe Sonarr::Api::Tag do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Tag.new(offline_client)
    api.responds_to?(:list).should be_true
    api.responds_to?(:create).should be_true
    api.responds_to?(:get).should be_true
    api.responds_to?(:update).should be_true
    api.responds_to?(:delete).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Tag.new(offline_client)
      _r1 : Array(Sonarr::Model::TagResource) = api.list
      _r2 : Sonarr::Model::TagResource? = api.create(Sonarr::Model::TagResource.from_json("{}"))
      _r3 : Sonarr::Model::TagResource? = api.get(1)
      _r4 : Sonarr::Model::TagResource? = api.update(1, Sonarr::Model::TagResource.from_json("{}"))
      _r5 : Nil = api.delete(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::TagDetails do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::TagDetails.new(offline_client)
    api.responds_to?(:list_detail).should be_true
    api.responds_to?(:get_detail).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::TagDetails.new(offline_client)
      _r1 : Array(Sonarr::Model::TagDetailsResource) = api.list_detail
      _r2 : Sonarr::Model::TagDetailsResource? = api.get_detail(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::Task do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Task.new(offline_client)
    api.responds_to?(:list_task).should be_true
    api.responds_to?(:get_task).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Task.new(offline_client)
      _r1 : Array(Sonarr::Model::TaskResource) = api.list_task
      _r2 : Sonarr::Model::TaskResource? = api.get_task(1)
    end
    true.should be_true
  end
end

describe Sonarr::Api::UiConfig do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::UiConfig.new(offline_client)
    api.responds_to?(:list_ui).should be_true
    api.responds_to?(:get_ui).should be_true
    api.responds_to?(:update_ui).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::UiConfig.new(offline_client)
      _r1 : Sonarr::Model::UiConfigResource? = api.list_ui
      _r2 : Sonarr::Model::UiConfigResource? = api.get_ui(1)
      _r3 : Sonarr::Model::UiConfigResource? = api.update_ui(1, Sonarr::Model::UiConfigResource.from_json("{}"))
    end
    true.should be_true
  end
end

describe Sonarr::Api::Update do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::Update.new(offline_client)
    api.responds_to?(:list).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::Update.new(offline_client)
      _r1 : Array(Sonarr::Model::UpdateResource) = api.list
    end
    true.should be_true
  end
end

describe Sonarr::Api::UpdateLogFile do
  it "wraps a client and exposes its generated methods" do
    api = Sonarr::Api::UpdateLogFile.new(offline_client)
    api.responds_to?(:list_file_update).should be_true
    api.responds_to?(:get_file_update).should be_true
  end

  it "type-checks every method against the schema signatures" do
    if false # ameba:disable Lint/LiteralInCondition
      api = Sonarr::Api::UpdateLogFile.new(offline_client)
      _r1 : Array(Sonarr::Model::LogFileResource) = api.list_file_update
      _r2 : Nil = api.get_file_update("x")
    end
    true.should be_true
  end
end
