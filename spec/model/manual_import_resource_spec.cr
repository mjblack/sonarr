require "../spec_helper"

describe Sonarr::Model::ManualImportResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "path": "/path/to/file.mkv",
      "relativePath": "file.mkv",
      "folderName": "Test Folder",
      "name": "Test File",
      "size": 123456,
      "series": {"id": 2, "title": "Test Series", "status": "continuing", "ended": false, "year": 2020, "qualityProfileId": 1, "seasonFolder": true, "monitored": true, "monitorNewItems": "all", "useSceneNumbering": false, "runtime": 45, "tvdbId": 12345, "tvRageId": 67890, "tvMazeId": 11111, "tmdbId": 22222, "seriesType": "standard", "added": "2020-01-01T12:00:00Z", "originalLanguage": {"id": 1, "name": "English"}, "ratings": {"votes": 100, "value": 8.5}, "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0}, "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutOffUnmetEpisodes": false}},
      "episodes": [{"id": 3, "seriesId": 2, "tvdbId": 3, "episodeFileId": 4, "seasonNumber": 1, "episodeNumber": 2, "title": "Pilot", "airDate": "2023-01-01", "airDateUtc": "2023-01-01T12:00:00Z", "runtime": 45, "hasFile": true, "monitored": true}],
      "quality": {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}},
      "languages": [],
      "rejections": []
    })
    import = Sonarr::Model::ManualImportResource.from_json(json)
    import.id.should eq(1)
    import.path.should eq("/path/to/file.mkv")
    import.relative_path.should eq("file.mkv")
    import.folder_name.should eq("Test Folder")
    import.name.should eq("Test File")
    import.size.should eq(123456)
    import.series.should be_a(Sonarr::Model::SeriesResource)
    import.episodes.should be_a(Array(Sonarr::Model::EpisodeResource))
    import.quality.quality.id.should eq(1)
    import.languages.should be_a(Array(Sonarr::Model::Language))
    import.rejections.should be_a(Array(Sonarr::Model::ImportRejectionResource))
  end
end 