require "../spec_helper"

describe Sonarr::Model::SeriesStatisticsResource do
  it "parses JSON with all required fields" do
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