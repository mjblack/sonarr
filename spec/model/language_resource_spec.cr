require "../spec_helper"

describe Sonarr::Model::LanguageResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "name": "English",
      "nameLower": "english"
    })
    lang = Sonarr::Model::LanguageResource.from_json(json)
    lang.id.should eq(1)
    lang.name.should eq("English")
    lang.name_lower.should eq("english")
  end
end 