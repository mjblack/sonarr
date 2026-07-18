require "../spec_helper"

describe Sonarr::Model::IndexerFlagResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "name": "Freeleech",
      "nameLower": "freeleech"
    })
    flag = Sonarr::Model::IndexerFlagResource.from_json(json)
    flag.id.should eq(1)
    flag.name.should eq("Freeleech")
    flag.name_lower.should eq("freeleech")
  end
end 