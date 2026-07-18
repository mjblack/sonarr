require "../spec_helper"

describe Sonarr::Model::SeriesResource do
  it "parses an empty object (all properties optional)" do
    series = Sonarr::Model::SeriesResource.from_json("{}")
    series.id.should be_nil
    series.status.should be_nil
    series.statistics.should be_nil
    series.seasons.should be_empty
    series.images.should be_empty
    series.tags.should be_empty
    series.genres.should be_empty
  end

  it "parses a fully-populated object" do
    series = Sonarr::Model::SeriesResource.from_json(SpecFixtures.series_json)
    series.id.should eq(2)
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
    present(series.original_language).id.should eq(1)
    present(series.original_language).name.should eq("English")
    present(series.ratings).votes.should eq(100)
    present(series.ratings).value.should eq(8.5)

    # seasonCount belongs to the *series* statistics shape.
    stats = present(series.statistics)
    stats.season_count.should eq(1)
    stats.episode_file_count.should eq(10)
    stats.episode_count.should eq(10)
    stats.total_episode_count.should eq(10)
    stats.size_on_disk.should eq(1024)
    stats.percent_of_episodes.should eq(100.0)

    add_options = present(series.add_options)
    add_options.ignore_episodes_with_files.should eq(false)
    add_options.ignore_episodes_without_files.should eq(false)
    add_options.monitor.should eq(Sonarr::MonitorTypes::Unknown)
    add_options.search_for_missing_episodes.should eq(false)
    add_options.search_for_cutoff_unmet_episodes.should eq(false)
  end

  it "round-trips enums as camelCase and back" do
    series = Sonarr::Model::SeriesResource.from_json(SpecFixtures.series_json)
    json = series.to_json
    json.should contain(%("status":"continuing"))
    json.should contain(%("seriesType":"standard"))
    json.should contain(%("monitorNewItems":"all"))

    reparsed = Sonarr::Model::SeriesResource.from_json(json)
    reparsed.status.should eq(Sonarr::SeriesStatusType::Continuing)
    reparsed.series_type.should eq(Sonarr::SeriesTypes::Standard)
    reparsed.monitor_new_items.should eq(Sonarr::NewItemMonitorTypes::All)
  end
end
