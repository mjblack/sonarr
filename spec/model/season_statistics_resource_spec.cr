require "../spec_helper"

describe Sonarr::Model::SeasonStatisticsResource do
  it "parses an empty object (all properties optional)" do
    stats = Sonarr::Model::SeasonStatisticsResource.from_json("{}")
    stats.episode_file_count.should be_nil
    stats.episode_count.should be_nil
    stats.release_groups.should be_empty
  end

  # SeasonStatisticsResource has no seasonCount (that belongs to
  # SeriesStatisticsResource); it tracks per-season episode counts only.
  it "parses a fully-populated object" do
    json = %({
      "episodeFileCount": 5,
      "episodeCount": 6,
      "totalEpisodeCount": 7,
      "sizeOnDisk": 512,
      "percentOfEpisodes": 80.0,
      "releaseGroups": ["GRP"]
    })
    stats = Sonarr::Model::SeasonStatisticsResource.from_json(json)
    stats.episode_file_count.should eq(5)
    stats.episode_count.should eq(6)
    stats.total_episode_count.should eq(7)
    stats.size_on_disk.should eq(512)
    stats.percent_of_episodes.should eq(80.0)
    stats.release_groups.should eq(["GRP"])
  end
end
