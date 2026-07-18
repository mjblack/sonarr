require "../spec_helper"

describe Sonarr::Model::LocalizationResource do
  it "parses an empty object (all properties optional)" do
    loc = Sonarr::Model::LocalizationResource.from_json("{}")
    loc.id.should be_nil
    loc.strings.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "strings": {"key1": "value1", "key2": "value2"}})
    loc = Sonarr::Model::LocalizationResource.from_json(json)
    loc.id.should eq(1)
    strings = present(loc.strings)
    strings["key1"].should eq("value1")
    strings["key2"].should eq("value2")
  end
end
