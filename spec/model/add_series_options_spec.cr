require "../spec_helper"

describe Sonarr::Model::AddSeriesOptions do
  it "parses an empty object (all properties optional)" do
    opts = Sonarr::Model::AddSeriesOptions.from_json("{}")
    opts.ignore_episodes_with_files.should be_nil
    opts.monitor.should be_nil
    opts.search_for_missing_episodes.should be_nil
  end

  it "parses a fully-populated object" do
    json = %({
      "ignoreEpisodesWithFiles": true,
      "ignoreEpisodesWithoutFiles": false,
      "monitor": "all",
      "searchForMissingEpisodes": true,
      "searchForCutoffUnmetEpisodes": false
    })
    opts = Sonarr::Model::AddSeriesOptions.from_json(json)
    opts.ignore_episodes_with_files.should eq(true)
    opts.ignore_episodes_without_files.should eq(false)
    opts.monitor.should eq(Sonarr::MonitorTypes::All)
    opts.search_for_missing_episodes.should eq(true)
    opts.search_for_cutoff_unmet_episodes.should eq(false)
  end

  it "round-trips the monitor enum as camelCase" do
    opts = Sonarr::Model::AddSeriesOptions.from_json(%({"monitor": "firstSeason"}))
    opts.to_json.should contain(%("monitor":"firstSeason"))
    Sonarr::Model::AddSeriesOptions.from_json(opts.to_json).monitor
      .should eq(Sonarr::MonitorTypes::FirstSeason)
  end
end
