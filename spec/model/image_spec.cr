require "../spec_helper"

describe Sonarr::Model::Image do
  it "parses JSON with all required fields" do
    json = %({
      "coverType": "poster",
      "url": "http://example.com/poster.jpg"
    })
    img = Sonarr::Model::Image.from_json(json)
    img.cover_type.should eq("poster")
    img.url.should eq("http://example.com/poster.jpg")
  end
end 