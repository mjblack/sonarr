require "../spec_helper"

describe Sonarr::Model::Ratings do
  it "parses JSON with all required fields" do
    json = %({
      "votes": 42,
      "value": 7.8
    })
    ratings = Sonarr::Model::Ratings.from_json(json)
    ratings.votes.should eq(42)
    ratings.value.should eq(7.8)
  end
end 