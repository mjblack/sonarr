require "../spec_helper"

describe Sonarr::Model::ImportListResource do
  it "parses an empty object (arrays default to empty)" do
    list = Sonarr::Model::ImportListResource.from_json("{}")
    list.id.should be_nil
    list.fields.should be_empty
    list.tags.should be_empty
    list.list_type.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "name": "Test Import List",
      "listType": "plex",
      "implementation": "PlexImport",
      "implementationName": "Plex Import",
      "configContract": "PlexImportSettings",
      "infoLink": "http://example.com",
      "fields": [{"name": "accessToken", "label": "Access Token", "value": "test123", "type": "textbox", "advanced": false}],
      "tags": []
    })
    list = Sonarr::Model::ImportListResource.from_json(json)
    list.id.should eq(1)
    list.name.should eq("Test Import List")
    list.list_type.should eq(Sonarr::ImportListType::Plex)
    list.implementation.should eq("PlexImport")
    list.implementation_name.should eq("Plex Import")
    list.config_contract.should eq("PlexImportSettings")
    list.info_link.should eq("http://example.com")
    list.fields.size.should eq(1)
    list.fields.first.name.should eq("accessToken")
    list.tags.should be_empty
  end
end
