require "../spec_helper"

describe Sonarr::Model::LanguageProfileItemResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "language": {"id": 1, "name": "English"},
      "allowed": true
    })
    item = Sonarr::Model::LanguageProfileItemResource.from_json(json)
    item.id.should eq(1)
    item.language.id.should eq(1)
    item.language.name.should eq("English")
    item.allowed.should eq(true)
  end
end 