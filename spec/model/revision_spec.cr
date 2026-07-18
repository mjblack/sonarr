require "../spec_helper"

describe Sonarr::Model::Revision do
  it "parses JSON with all required fields" do
    json = %({
      "version": 1,
      "real": 0,
      "isRepack": false
    })
    rev = Sonarr::Model::Revision.from_json(json)
    rev.version.should eq(1)
    rev.real.should eq(0)
    rev.is_repack?.should eq(false)
  end
end 