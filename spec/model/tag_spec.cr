require "../spec_helper"

describe Sonarr::Model::Tag do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "label": "Test Tag"
    })
    tag = Sonarr::Model::Tag.from_json(json)
    tag.id.should eq(1)
    tag.label.should eq("Test Tag")
  end
end 