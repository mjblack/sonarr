require "../spec_helper"

describe Sonarr::Model::LocalizationLanguageResource do
  it "parses an empty object (all properties optional)" do
    lang = Sonarr::Model::LocalizationLanguageResource.from_json("{}")
    lang.identifier.should be_nil
  end

  it "parses a fully-populated object" do
    lang = Sonarr::Model::LocalizationLanguageResource.from_json(%({"identifier": "en"}))
    lang.identifier.should eq("en")
  end
end
