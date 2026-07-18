require "../spec_helper"

describe Sonarr::Model::QueueResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "series": {"id": 2, "title": "Test Series", "status": "continuing", "ended": false, "year": 2020, "qualityProfileId": 1, "seasonFolder": true, "monitored": true, "monitorNewItems": "all", "useSceneNumbering": false, "runtime": 45, "tvdbId": 12345, "tvRageId": 67890, "tvMazeId": 11111, "tmdbId": 22222, "seriesType": "standard", "added": "2020-01-01T12:00:00Z", "originalLanguage": {"id": 1, "name": "English"}, "ratings": {"votes": 100, "value": 8.5}, "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0}, "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutOffUnmetEpisodes": false}},
      "episode": {"id": 3, "seriesId": 2, "tvdbId": 3, "episodeFileId": 4, "seasonNumber": 1, "episodeNumber": 2, "title": "Pilot", "airDate": "2023-01-01", "airDateUtc": "2023-01-01T12:00:00Z", "runtime": 45, "hasFile": true, "monitored": true},
      "quality": {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}},
      "size": 123456,
      "status": "queued"
    })
    queue = Sonarr::Model::QueueResource.from_json(json)
    queue.id.should eq(1)
    queue.series.should_not be_nil
    queue.series.try &.id.should eq(2)
    queue.episode.should_not be_nil
    queue.episode.try &.id.should eq(3)
    queue.quality.quality.id.should eq(1)
    queue.quality.quality.name.should eq("HDTV")
    queue.quality.quality.source.should eq(Sonarr::QualitySource::Web)
    queue.quality.quality.resolution.should eq(1080)
    queue.quality.revision.version.should eq(1)
    queue.quality.revision.real.should eq(0)
    queue.quality.revision.is_repack?.should eq(false)
    queue.size.should eq(123456)
    queue.status.should eq("queued")
  end
end 