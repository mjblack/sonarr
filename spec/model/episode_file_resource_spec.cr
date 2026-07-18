require "../spec_helper"

describe Sonarr::Model::EpisodeFileResource do
  it "parses JSON with all required fields" do
    json = %({
      "id": 1,
      "seriesId": 2,
      "seasonNumber": 1,
      "relativePath": "S01E02.mkv",
      "size": 123456,
      "dateAdded": "2023-01-01T12:00:00Z",
      "quality": {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}},
      "languages": [],
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
    file.quality.quality.id.should eq(1)
    file.quality.quality.name.should eq("HDTV")
    file.quality.quality.source.should eq(Sonarr::QualitySource::Web)
    file.quality.quality.resolution.should eq(1080)
    file.quality.revision.version.should eq(1)
    file.quality.revision.real.should eq(0)
    file.quality.revision.is_repack?.should eq(false)
    file.languages.should be_a(Array(Sonarr::Model::Language))
    file.custom_formats.should be_a(Array(Sonarr::Model::CustomFormatResource))
    file.custom_format_score.should eq(0)
    file.release_type.should eq(Sonarr::ReleaseType::Unknown)
    file.media_info.should be_a(Sonarr::Model::MediaInfoResource)
    file.quality_cutoff_not_met.should eq(false)
  end
end 