require "../spec_helper"

describe Sonarr::Model::LocalizationResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "strings": {"key1": "value1", "key2": "value2"}
    })
    loc = Sonarr::Model::LocalizationResource.from_json(json)
    loc.id.should eq(1)
    loc.strings.should be_a(Hash(String, String?))
    loc.strings.try &.["key1"].should eq("value1")
    loc.strings.try &.["key2"].should eq("value2")
  end
end 