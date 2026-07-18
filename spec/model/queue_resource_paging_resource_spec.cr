require "../spec_helper"

describe Sonarr::Model::QueueResourcePagingResource do
  it "parses JSON with all required fields" do
    json = %({
      "page": 1,
      "pageSize": 10,
      "sortKey": "time",
      "sortDirection": "descending",
      "totalRecords": 100,
      "records": [{"id": 1, "series": {"id": 2, "title": "Test Series", "status": "continuing", "ended": false, "year": 2020, "qualityProfileId": 1, "seasonFolder": true, "monitored": true, "monitorNewItems": "all", "useSceneNumbering": false, "runtime": 45, "tvdbId": 12345, "tvRageId": 67890, "tvMazeId": 11111, "tmdbId": 22222, "seriesType": "standard", "added": "2020-01-01T12:00:00Z", "originalLanguage": {"id": 1, "name": "English"}, "ratings": {"votes": 100, "value": 8.5}, "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0}, "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutOffUnmetEpisodes": false}}, "episode": {"id": 3, "seriesId": 2, "tvdbId": 3, "episodeFileId": 4, "seasonNumber": 1, "episodeNumber": 2, "title": "Pilot", "airDate": "2023-01-01", "airDateUtc": "2023-01-01T12:00:00Z", "runtime": 45, "hasFile": true, "monitored": true}, "quality": {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}}, "size": 123456, "status": "queued"}]
    })
    paging = Sonarr::Model::QueueResourcePagingResource.from_json(json)
    paging.page.should eq(1)
    paging.page_size.should eq(10)
    paging.sort_key.should eq("time")
    paging.sort_direction.should eq(Sonarr::SortDirection::Descending)
    paging.total_records.should eq(100)
    paging.records.should be_a(Array(Sonarr::Model::QueueResource))
  end
end 