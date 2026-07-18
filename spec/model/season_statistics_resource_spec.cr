require "../spec_helper"

describe Sonarr::Model::SeasonStatisticsResource do
  it "parses JSON with all required fields" do
    json = %({
      "episodeFileCount": 5,
      "episodeCount": 6,
      "totalEpisodeCount": 7,
      "size_on_disk": 512,
      "percentOfEpisodes": 80.0
    })
    stats = Sonarr::Model::SeasonStatisticsResource.from_json(json)
    stats.episode_file_count.should eq(5)
    stats.episode_count.should eq(6)
    stats.total_episode_count.should eq(7)
    stats.size_on_disk.should eq(512)
    stats.percent_of_episodes.should eq(80.0)
  end
end 