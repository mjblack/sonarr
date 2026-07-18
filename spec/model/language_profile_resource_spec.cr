require "../spec_helper"

describe Sonarr::Model::LanguageProfileResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "name": "English Profile",
      "upgradeAllowed": true,
      "cutoff": {"id": 1, "name": "English"},
      "languages": [{"id": 1, "name": "English", "nameLower": "english"}]
    })
    profile = Sonarr::Model::LanguageProfileResource.from_json(json)
    profile.id.should eq(1)
    profile.name.should eq("English Profile")
    profile.upgrade_allowed.should eq(true)
    profile.cutoff.id.should eq(1)
    profile.cutoff.name.should eq("English")
    profile.languages.should be_a(Array(Sonarr::Model::LanguageResource))
  end
end 