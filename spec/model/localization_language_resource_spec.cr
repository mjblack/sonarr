require "../spec_helper"

describe Sonarr::Model::LocalizationLanguageResource do
  it "parses JSON with all required fields" do
    json = %({
      "identifier": "en"
    })
    lang = Sonarr::Model::LocalizationLanguageResource.from_json(json)
    lang.identifier.should eq("en")
  end
end 