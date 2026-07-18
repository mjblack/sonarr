require "../spec_helper"

describe Sonarr::Model::EpisodeResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "seriesId": 2,
      "tvdbId": 3,
      "episodeFileId": 4,
      "seasonNumber": 1,
      "episodeNumber": 2,
      "title": "Pilot",
      "airDate": "2023-01-01",
      "airDateUtc": "2023-01-01T12:00:00Z",
      "lastSearchTime": "2023-01-01T13:00:00Z",
      "runtime": 45,
      "finaleType": "season",
      "overview": "The first episode.",
      "episodeFile": {"id": 4, "relativePath": "S01E02.mkv", "size": 123456, "dateAdded": "2023-01-01T12:00:00Z", "quality": {"id": 1, "name": "HDTV"}, "qualityModifier": 0, "mediaInfo": {"audioBitrate": 128, "videoBitrate": 1000}},
      "hasFile": true,
      "monitored": true,
      "absoluteEpisodeNumber": 2,
      "sceneAbsoluteEpisodeNumber": 2,
      "sceneEpisodeNumber": 2,
      "sceneSeasonNumber": 1,
      "unverifiedSceneNumbering": false,
      "endTime": "2023-01-01T14:00:00Z",
      "grabDate": "2023-01-01T15:00:00Z",
      "series": {"id": 2, "title": "Test Series", "status": "continuing", "ended": false, "year": 2020, "qualityProfileId": 1, "seasonFolder": true, "monitored": true, "monitorNewItems": "all", "useSceneNumbering": false, "runtime": 45, "tvdbId": 12345, "tvRageId": 67890, "tvMazeId": 11111, "tmdbId": 22222, "seriesType": "standard", "added": "2020-01-01T12:00:00Z", "originalLanguage": {"id": 1, "name": "English"}, "ratings": {"votes": 100, "value": 8.5}, "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0}, "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutOffUnmetEpisodes": false}},
      "images": []
    })
    ep = Sonarr::Model::EpisodeResource.from_json(json)
    ep.id.should eq(1)
    ep.series_id.should eq(2)
    ep.tvdb_id.should eq(3)
    ep.episode_file_id.should eq(4)
    ep.season_number.should eq(1)
    ep.episode_number.should eq(2)
    ep.title.should eq("Pilot")
    ep.air_date.should eq("2023-01-01")
    ep.air_date_utc.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    ep.last_search_time.should eq(Time.utc(2023, 1, 1, 13, 0, 0))
    ep.runtime.should eq(45)
    ep.finale_type.should eq("season")
    ep.overview.should eq("The first episode.")
    ep.has_file.should eq(true)
    ep.monitored.should eq(true)
    ep.absolute_episode_number.should eq(2)
    ep.scene_absolute_episode_number.should eq(2)
    ep.scene_episode_number.should eq(2)
    ep.scene_season_number.should eq(1)
    ep.unverified_scene_numbering.should eq(false)
    ep.end_time.should eq(Time.utc(2023, 1, 1, 14, 0, 0))
    ep.grab_date.should eq(Time.utc(2023, 1, 1, 15, 0, 0))
    ep.series.id.should eq(2)
    ep.images.should be_a(Array(Sonarr::Model::MediaCover))
  end
end 