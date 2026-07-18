require "../spec_helper"

describe Sonarr::Model::IndexerResource do
  it "parses JSON with all required fields" do
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
    indexer.fields.should be_a(Array(Sonarr::Model::Field))
    indexer.implementation_name.should eq("Newznab")
    indexer.implementation.should eq("Newznab")
    indexer.config_contract.should eq("NewznabSettings")
    indexer.info_link.should eq("http://example.com")
    indexer.tags.should be_a(Array(Int32))
  end
end 