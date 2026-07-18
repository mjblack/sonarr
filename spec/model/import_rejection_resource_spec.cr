require "../spec_helper"

describe Sonarr::Model::ImportRejectionResource do
  it "parses an empty object (all properties optional)" do
    rejection = Sonarr::Model::ImportRejectionResource.from_json("{}")
    rejection.reason.should be_nil
    rejection.type_field.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({"type": "permanent", "reason": "Test rejection"})
    rejection = Sonarr::Model::ImportRejectionResource.from_json(json)
    rejection.type_field.should eq(Sonarr::RejectionType::Permanent)
    rejection.reason.should eq("Test rejection")
  end
end
