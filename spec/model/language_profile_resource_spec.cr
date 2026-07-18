require "../spec_helper"

describe Sonarr::Model::LanguageProfileResource do
  it "parses an empty object (arrays default to empty)" do
    profile = Sonarr::Model::LanguageProfileResource.from_json("{}")
    profile.id.should be_nil
    profile.cutoff.should be_nil
    profile.languages.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "name": "English Profile",
      "upgradeAllowed": true,
      "cutoff": {"id": 1, "name": "English"},
      "languages": [{"id": 1, "language": {"id": 1, "name": "English"}, "allowed": true}]
    })
    profile = Sonarr::Model::LanguageProfileResource.from_json(json)
    profile.id.should eq(1)
    profile.name.should eq("English Profile")
    profile.upgrade_allowed.should eq(true)
    present(profile.cutoff).id.should eq(1)
    present(profile.cutoff).name.should eq("English")
    profile.languages.size.should eq(1)
    profile.languages.first.allowed.should eq(true)
  end
end
