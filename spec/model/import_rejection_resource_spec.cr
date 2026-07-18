require "../spec_helper"

describe Sonarr::Model::ImportRejectionResource do
  it "parses JSON with all required fields" do
    json = %({
      "type": "permanent",
      "reason": "Test rejection"
    })
    rejection = Sonarr::Model::ImportRejectionResource.from_json(json)
    rejection.type.should eq(Sonarr::RejectionType::Permanent)
    rejection.reason.should eq("Test rejection")
  end
end 