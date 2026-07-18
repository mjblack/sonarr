require "../spec_helper"

describe Sonarr::Model::AddSeriesOptions do
  it "parses JSON with all required fields" do
    json = %({
      "ignoreEpisodesWithFiles": true,
      "ignoreEpisodesWithoutFiles": false,
      "monitor": "all",
      "searchForMissingEpisodes": true,
      "searchForCutOffUnmetEpisodes": false
    })
    opts = Sonarr::Model::AddSeriesOptions.from_json(json)
    opts.ignore_episodes_with_files?.should eq(true)
    opts.ignore_episodes_without_files?.should eq(false)
    opts.monitor.should eq(Sonarr::MonitorType::All)
    opts.search_for_missing_episodes?.should eq(true)
    opts.search_for_cut_off_unmet_episodes?.should eq(false)
  end
end 