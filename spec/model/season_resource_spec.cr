require "../spec_helper"

describe Sonarr::Model::SeasonResource do
  it "parses JSON with all required fields" do
    json = %({
      "seasonNumber": 1,
      "monitored": true,
      "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0},
      "images": []
    })
    season = Sonarr::Model::SeasonResource.from_json(json)
    season.season_number.should eq(1)
    season.monitored?.should eq(true)
    season.statistics.season_count.should eq(1)
    season.images.should be_a(Array(Sonarr::Model::MediaCover))
  end
end 