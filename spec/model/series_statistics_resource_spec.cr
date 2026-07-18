require "../spec_helper"

describe Sonarr::Model::SeriesStatisticsResource do
  it "parses an empty object (all properties optional)" do
    stats = Sonarr::Model::SeriesStatisticsResource.from_json("{}")
    stats.season_count.should be_nil
    stats.episode_count.should be_nil
    stats.release_groups.should be_empty
  end

  # seasonCount is unique to the *series* statistics shape.
  it "parses a fully-populated object" do
    json = %({
      "seasonCount": 2,
      "episodeFileCount": 20,
      "episodeCount": 22,
      "totalEpisodeCount": 24,
      "sizeOnDisk": 2048,
      "percentOfEpisodes": 90.0
    })
    stats = Sonarr::Model::SeriesStatisticsResource.from_json(json)
    stats.season_count.should eq(2)
    stats.episode_file_count.should eq(20)
    stats.episode_count.should eq(22)
    stats.total_episode_count.should eq(24)
    stats.size_on_disk.should eq(2048)
    stats.percent_of_episodes.should eq(90.0)
  end
end
