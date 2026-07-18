require "../spec_helper"

describe Sonarr::Model::SeriesResource do
  describe "from JSON" do
    it "parses JSON with all required fields" do
      json = %({
        "id": 1,
        "title": "Test Series",
        "status": "continuing",
        "ended": false,
        "year": 2020,
        "qualityProfileId": 1,
        "seasonFolder": true,
        "monitored": true,
        "monitorNewItems": "all",
        "useSceneNumbering": false,
        "runtime": 45,
        "tvdbId": 12345,
        "tvRageId": 67890,
        "tvMazeId": 11111,
        "tmdbId": 22222,
        "seriesType": "standard",
        "added": "2020-01-01T12:00:00Z",
        "originalLanguage": {"id": 1, "name": "English"},
        "ratings": {"votes": 100, "value": 8.5},
        "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0},
        "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutOffUnmetEpisodes": false}
      })
      series = Sonarr::Model::SeriesResource.from_json(json)
      series.id.should eq(1)
      series.title.should eq("Test Series")
      series.status.should eq(Sonarr::SeriesStatusType::Continuing)
      series.ended.should eq(false)
      series.year.should eq(2020)
      series.quality_profile_id.should eq(1)
      series.season_folder.should eq(true)
      series.monitored.should eq(true)
      series.monitor_new_items.should eq(Sonarr::NewItemMonitorTypes::All)
      series.use_scene_numbering.should eq(false)
      series.runtime.should eq(45)
      series.tvdb_id.should eq(12345)
      series.tv_rage_id.should eq(67890)
      series.tv_maze_id.should eq(11111)
      series.tmdb_id.should eq(22222)
      series.series_type.should eq(Sonarr::SeriesTypes::Standard)
      series.added.should eq(Time.utc(2020, 1, 1, 12, 0, 0))
      series.original_language.id.should eq(1)
      series.original_language.name.should eq("English")
      series.ratings.votes.should eq(100)
      series.ratings.value.should eq(8.5)
      series.statistics.season_count.should eq(1)
      series.statistics.episode_file_count.should eq(10)
      series.statistics.episode_count.should eq(10)
      series.statistics.total_episode_count.should eq(10)
      series.statistics.size_on_disk.should eq(1024)
      series.statistics.percent_of_episodes.should eq(100.0)
      series.add_options.ignore_episodes_with_files?.should eq(false)
      series.add_options.ignore_episodes_without_files?.should eq(false)
      series.add_options.monitor.should eq(Sonarr::MonitorType::Unknown)
      series.add_options.search_for_missing_episodes?.should eq(false)
      series.add_options.search_for_cut_off_unmet_episodes?.should eq(false)
    end
  end
end 