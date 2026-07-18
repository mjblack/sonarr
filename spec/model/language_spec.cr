require "../spec_helper"

describe Sonarr::Model::Language do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "name": "English"
    })
    lang = Sonarr::Model::Language.from_json(json)
    lang.id.should eq(1)
    lang.name.should eq("English")
  end
end 