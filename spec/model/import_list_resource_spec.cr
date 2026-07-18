require "../spec_helper"

describe Sonarr::Model::ImportListResource do
  it "parses JSON with all required fields" do
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
    list.fields.should be_a(Array(Sonarr::Model::Field))
    list.tags.should be_a(Array(Int32))
  end
end 