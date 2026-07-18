require "../spec_helper"

describe Sonarr::Model::IndexerResource do
  it "parses an empty object (arrays default to empty)" do
    indexer = Sonarr::Model::IndexerResource.from_json("{}")
    indexer.id.should be_nil
    indexer.fields.should be_empty
    indexer.tags.should be_empty
    indexer.protocol.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "name": "Test Indexer",
      "protocol": "usenet",
      "supportsRss": true,
      "supportsSearch": true,
      "fields": [{"name": "apiKey", "label": "API Key", "value": "test123", "type": "textbox", "advanced": false}],
      "implementationName": "Newznab",
      "implementation": "Newznab",
      "configContract": "NewznabSettings",
      "infoLink": "http://example.com",
      "tags": []
    })
    indexer = Sonarr::Model::IndexerResource.from_json(json)
    indexer.id.should eq(1)
    indexer.name.should eq("Test Indexer")
    indexer.protocol.should eq(Sonarr::DownloadProtocol::Usenet)
    indexer.supports_rss.should eq(true)
    indexer.supports_search.should eq(true)
    indexer.fields.size.should eq(1)
    indexer.fields.first.name.should eq("apiKey")
    indexer.implementation_name.should eq("Newznab")
    indexer.implementation.should eq("Newznab")
    indexer.config_contract.should eq("NewznabSettings")
    indexer.info_link.should eq("http://example.com")
    indexer.tags.should be_empty
  end
end
