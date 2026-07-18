require "../spec_helper"

describe Sonarr::Model::Language do
  it "parses an empty object (all properties optional)" do
    lang = Sonarr::Model::Language.from_json("{}")
    lang.id.should be_nil
    lang.name.should be_nil
  end

  it "parses a fully-populated object" do
    lang = Sonarr::Model::Language.from_json(%({"id": 1, "name": "English"}))
    lang.id.should eq(1)
    lang.name.should eq("English")
  end
end
