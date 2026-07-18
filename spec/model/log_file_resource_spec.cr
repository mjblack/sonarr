require "../spec_helper"

describe Sonarr::Model::LogFileResource do
  it "parses an empty object (all properties optional)" do
    log = Sonarr::Model::LogFileResource.from_json("{}")
    log.id.should be_nil
    log.filename.should be_nil
    log.last_write_time.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "filename": "sonarr.log",
      "lastWriteTime": "2023-01-01T12:00:00Z",
      "contentsUrl": "/api/v3/log/file/contents",
      "downloadUrl": "/api/v3/log/file/download"
    })
    log = Sonarr::Model::LogFileResource.from_json(json)
    log.id.should eq(1)
    log.filename.should eq("sonarr.log")
    log.last_write_time.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    log.contents_url.should eq("/api/v3/log/file/contents")
    log.download_url.should eq("/api/v3/log/file/download")
  end
end
