require "../spec_helper"

describe Sonarr::Model::MediaCover do
  it "parses JSON with all required fields" do
    json = %({
      "coverType": "banner",
      "url": "http://example.com/banner.jpg",
      "remoteUrl": "http://example.com/remote.jpg"
    })
    cover = Sonarr::Model::MediaCover.from_json(json)
    cover.cover_type.should eq("banner")
    cover.url.should eq("http://example.com/banner.jpg")
    cover.remote_url.should eq("http://example.com/remote.jpg")
  end
end 