require "../spec_helper"

describe Sonarr::Model::IndexerFlagResource do
  it "parses an empty object (all properties optional)" do
    flag = Sonarr::Model::IndexerFlagResource.from_json("{}")
    flag.id.should be_nil
    flag.name.should be_nil
    flag.name_lower.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"id": 1, "name": "Freeleech", "nameLower": "freeleech"})
    flag = Sonarr::Model::IndexerFlagResource.from_json(json)
    flag.id.should eq(1)
    flag.name.should eq("Freeleech")
    flag.name_lower.should eq("freeleech")
  end
end
