require "../spec_helper"

describe Sonarr::Model::ManualImportReprocessResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "path": "/path/to/file.mkv",
      "seriesId": 2,
      "seasonNumber": 1,
      "episodes": [{"id": 3, "seriesId": 2, "tvdbId": 3, "episodeFileId": 4, "seasonNumber": 1, "episodeNumber": 2, "title": "Pilot", "airDate": "2023-01-01", "airDateUtc": "2023-01-01T12:00:00Z", "runtime": 45, "hasFile": true, "monitored": true}],
      "episodeIds": [3],
      "quality": {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}},
      "languages": [],
      "releaseGroup": "TestGroup",
      "downloadId": "download123",
      "customFormats": [],
      "customFormatScore": 0,
      "indexerFlags": 0,
      "releaseType": "unknown",
      "rejections": []
    })
    import = Sonarr::Model::ManualImportReprocessResource.from_json(json)
    import.id.should eq(1)
    import.path.should eq("/path/to/file.mkv")
    import.series_id.should eq(2)
    import.season_number.should eq(1)
    import.episodes.should be_a(Array(Sonarr::Model::EpisodeResource))
    import.episode_ids.should eq([3])
    import.quality.quality.id.should eq(1)
    import.languages.should be_a(Array(Sonarr::Model::Language))
    import.release_group.should eq("TestGroup")
    import.download_id.should eq("download123")
    import.custom_formats.should be_a(Array(Sonarr::Model::CustomFormatResource))
    import.custom_format_score.should eq(0)
    import.indexer_flags.should eq(0)
    import.release_type.should eq(Sonarr::ReleaseType::Unknown)
    import.rejections.should be_a(Array(Sonarr::Model::ImportRejectionResource))
  end
end 