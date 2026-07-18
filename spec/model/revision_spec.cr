require "../spec_helper"

describe Sonarr::Model::Revision do
  it "parses an empty object (all properties optional)" do
    rev = Sonarr::Model::Revision.from_json("{}")
    rev.version.should be_nil
    rev.real.should be_nil
    rev.is_repack.should be_nil
  end

  it "parses a fully-populated object" do
    rev = Sonarr::Model::Revision.from_json(%({"version": 1, "real": 0, "isRepack": false}))
    rev.version.should eq(1)
    rev.real.should eq(0)
    rev.is_repack.should eq(false)
  end
end
