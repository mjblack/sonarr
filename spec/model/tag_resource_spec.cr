require "../spec_helper"

describe Sonarr::Model::TagResource do
  it "parses an empty object (all properties optional)" do
    tag = Sonarr::Model::TagResource.from_json("{}")
    tag.id.should be_nil
    tag.label.should be_nil
  end

  it "parses a fully-populated object" do
    tag = Sonarr::Model::TagResource.from_json(%({"id": 1, "label": "Test Tag"}))
    tag.id.should eq(1)
    tag.label.should eq("Test Tag")
  end
end
