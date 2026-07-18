require "../spec_helper"

describe Sonarr::Model::Ratings do
  it "parses an empty object (all properties optional)" do
    ratings = Sonarr::Model::Ratings.from_json("{}")
    ratings.votes.should be_nil
    ratings.value.should be_nil
  end

  it "parses a fully-populated object" do
    ratings = Sonarr::Model::Ratings.from_json(%({"votes": 42, "value": 7.8}))
    ratings.votes.should eq(42)
    ratings.value.should eq(7.8)
  end
end
