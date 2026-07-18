require "../spec_helper"

describe Sonarr::Model::AlternateTitleResource do
  it "parses an empty object (all properties optional)" do
    alt = Sonarr::Model::AlternateTitleResource.from_json("{}")
    alt.title.should be_nil
    alt.season_number.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "title": "Alt Title",
      "seasonNumber": 1,
      "sceneSeasonNumber": 2,
      "sceneOrigin": "origin",
      "comment": "A comment"
    })
    alt = Sonarr::Model::AlternateTitleResource.from_json(json)
    alt.title.should eq("Alt Title")
    alt.season_number.should eq(1)
    alt.scene_season_number.should eq(2)
    alt.scene_origin.should eq("origin")
    alt.comment.should eq("A comment")
  end
end
