require "../spec_helper"

describe Sonarr::Model::History do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "episodeId": 2,
      "seriesId": 3,
      "sourceTitle": "Test.Series.S01E02.HDTV.x264",
      "quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080},
      "qualityCutoffNotMet": false,
      "date": "2023-01-01T12:00:00Z",
      "downloadId": "download123",
      "eventType": "grabbed",
      "data": {"indexer": "TestIndexer", "protocol": "usenet"}
    })
    history = Sonarr::Model::History.from_json(json)
    history.id.should eq(1)
    history.episode_id.should eq(2)
    history.series_id.should eq(3)
    history.source_title.should eq("Test.Series.S01E02.HDTV.x264")
    history.quality.id.should eq(1)
    history.quality.name.should eq("HDTV")
    history.quality.source.should eq(Sonarr::QualitySource::Web)
    history.quality.resolution.should eq(1080)
    history.quality_cutoff_not_met.should eq(false)
    history.date.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    history.download_id.should eq("download123")
    history.event_type.should eq("grabbed")
    history.data.should be_a(Hash(String, String))
  end
end 