require "../spec_helper"

describe Sonarr::Model::ManualImportReprocessResource do
  it "parses an empty object (arrays default to empty)" do
    import = Sonarr::Model::ManualImportReprocessResource.from_json("{}")
    import.id.should be_nil
    import.quality.should be_nil
    import.episodes.should be_empty
    import.episode_ids.should be_empty
    import.rejections.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "path": "/path/to/file.mkv",
      "seriesId": 2,
      "seasonNumber": 1,
      "episodes": [#{SpecFixtures.episode_json}],
      "episodeIds": [3],
      "quality": #{SpecFixtures.quality_model_json},
      "languages": [{"id": 1, "name": "English"}],
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
    import.episodes.size.should eq(1)
    import.episode_ids.should eq([3])
    present(present(import.quality).quality).id.should eq(1)
    import.languages.size.should eq(1)
    import.release_group.should eq("TestGroup")
    import.download_id.should eq("download123")
    import.custom_formats.should be_empty
    import.custom_format_score.should eq(0)
    import.indexer_flags.should eq(0)
    import.release_type.should eq(Sonarr::ReleaseType::Unknown)
    import.rejections.should be_empty
  end
end
