require "../spec_helper"

describe Sonarr::Model::QueueResource do
  it "parses an empty object (arrays default to empty)" do
    queue = Sonarr::Model::QueueResource.from_json("{}")
    queue.id.should be_nil
    queue.series.should be_nil
    queue.episode.should be_nil
    queue.quality.should be_nil
    queue.status.should be_nil
    queue.status_messages.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "series": #{SpecFixtures.series_json},
      "episode": #{SpecFixtures.episode_json},
      "quality": #{SpecFixtures.quality_model_json},
      "size": 123456,
      "status": "queued",
      "protocol": "usenet",
      "trackedDownloadStatus": "ok",
      "trackedDownloadState": "downloading"
    })
    queue = Sonarr::Model::QueueResource.from_json(json)
    queue.id.should eq(1)
    present(queue.series).id.should eq(2)
    present(queue.episode).id.should eq(3)
    quality = present(queue.quality)
    present(quality.quality).id.should eq(1)
    present(quality.quality).name.should eq("HDTV")
    present(quality.quality).source.should eq(Sonarr::QualitySource::Web)
    present(quality.revision).version.should eq(1)
    queue.size.should eq(123456.0)
    queue.status.should eq(Sonarr::QueueStatus::Queued)
    queue.protocol.should eq(Sonarr::DownloadProtocol::Usenet)
    queue.tracked_download_status.should eq(Sonarr::TrackedDownloadStatus::Ok)
    queue.tracked_download_state.should eq(Sonarr::TrackedDownloadState::Downloading)
  end
end
