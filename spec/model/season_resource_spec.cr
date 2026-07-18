require "../spec_helper"

describe Sonarr::Model::SeasonResource do
  it "parses an empty object (all properties optional)" do
    season = Sonarr::Model::SeasonResource.from_json("{}")
    season.season_number.should be_nil
    season.monitored.should be_nil
    season.statistics.should be_nil
    season.images.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "seasonNumber": 1,
      "monitored": true,
      "statistics": {"episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0},
      "images": [{"coverType": "poster", "url": "http://example.com/poster.jpg"}]
    })
    season = Sonarr::Model::SeasonResource.from_json(json)
    season.season_number.should eq(1)
    season.monitored.should eq(true)
    # Season statistics carry per-season episode counts (no seasonCount).
    stats = present(season.statistics)
    stats.episode_file_count.should eq(10)
    stats.episode_count.should eq(10)
    stats.total_episode_count.should eq(10)
    stats.size_on_disk.should eq(1024)
    stats.percent_of_episodes.should eq(100.0)
    season.images.size.should eq(1)
    season.images.first.cover_type.should eq(Sonarr::MediaCoverTypes::Poster)
  end
end
