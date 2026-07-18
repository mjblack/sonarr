require "../spec_helper"

describe Sonarr::Model::LanguageProfileItemResource do
  it "parses an empty object (all properties optional)" do
    item = Sonarr::Model::LanguageProfileItemResource.from_json("{}")
    item.id.should be_nil
    item.language.should be_nil
    item.allowed.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "language": {"id": 1, "name": "English"}, "allowed": true})
    item = Sonarr::Model::LanguageProfileItemResource.from_json(json)
    item.id.should eq(1)
    present(item.language).id.should eq(1)
    present(item.language).name.should eq("English")
    item.allowed.should eq(true)
  end
end
