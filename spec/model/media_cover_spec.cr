require "../spec_helper"

describe Sonarr::Model::MediaCover do
  it "parses an empty object (all properties optional)" do
    cover = Sonarr::Model::MediaCover.from_json("{}")
    cover.cover_type.should be_nil
    cover.url.should be_nil
    cover.remote_url.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "coverType": "banner",
      "url": "http://example.com/banner.jpg",
      "remoteUrl": "http://example.com/remote.jpg"
    })
    cover = Sonarr::Model::MediaCover.from_json(json)
    cover.cover_type.should eq(Sonarr::MediaCoverTypes::Banner)
    cover.url.should eq("http://example.com/banner.jpg")
    cover.remote_url.should eq("http://example.com/remote.jpg")
  end

  it "round-trips the coverType enum as camelCase" do
    cover = Sonarr::Model::MediaCover.from_json(%({"coverType": "clearlogo"}))
    cover.to_json.should contain(%("coverType":"clearlogo"))
    Sonarr::Model::MediaCover.from_json(cover.to_json).cover_type
      .should eq(Sonarr::MediaCoverTypes::Clearlogo)
  end
end
