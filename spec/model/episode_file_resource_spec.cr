require "../spec_helper"

describe Sonarr::Model::EpisodeFileResource do
  it "parses an empty object (arrays default to empty)" do
    file = Sonarr::Model::EpisodeFileResource.from_json("{}")
    file.id.should be_nil
    file.quality.should be_nil
    file.languages.should be_empty
    file.custom_formats.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "seriesId": 2,
      "seasonNumber": 1,
      "relativePath": "S01E02.mkv",
      "size": 123456,
      "dateAdded": "2023-01-01T12:00:00Z",
      "quality": #{SpecFixtures.quality_model_json},
      "languages": [{"id": 1, "name": "English"}],
      "customFormats": [],
      "customFormatScore": 0,
      "releaseType": "unknown",
      "mediaInfo": {"audioBitrate": 128, "videoBitrate": 1000},
      "qualityCutoffNotMet": false
    })
    file = Sonarr::Model::EpisodeFileResource.from_json(json)
    file.id.should eq(1)
    file.series_id.should eq(2)
    file.season_number.should eq(1)
    file.relative_path.should eq("S01E02.mkv")
    file.size.should eq(123456)
    file.date_added.should eq(Time.utc(2023, 1, 1, 12, 0, 0))
    quality = present(file.quality)
    present(quality.quality).id.should eq(1)
    present(quality.quality).name.should eq("HDTV")
    present(quality.quality).source.should eq(Sonarr::QualitySource::Web)
    present(quality.quality).resolution.should eq(1080)
    present(quality.revision).version.should eq(1)
    present(quality.revision).real.should eq(0)
    present(quality.revision).is_repack.should eq(false)
    file.languages.size.should eq(1)
    file.custom_formats.should be_empty
    file.custom_format_score.should eq(0)
    file.release_type.should eq(Sonarr::ReleaseType::Unknown)
    file.media_info.should be_a(Sonarr::Model::MediaInfoResource)
    file.quality_cutoff_not_met.should eq(false)
  end
end
