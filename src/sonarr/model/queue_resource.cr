class Sonarr::Model::QueueResource < Sonarr::Model

  @[JSON::Field(key: "id")]
  property id : Int32

  @[JSON::Field(key: "seriesId", emit_null: true)]
  property series_id : Int32?

  @[JSON::Field(key: "episodeId", emit_null: true)]
  property episode_id : Int32?

  @[JSON::Field(key: "seasonNumber", emit_null: true)]
  property season_number : Int32?

  @[JSON::Field(key: "series", emit_null: true)]
  property series : SeriesResource?

  @[JSON::Field(key: "episode", emit_null: true)]
  property episode : EpisodeResource?

  @[JSON::Field(key: "languages", emit_null: true)]
  property languages : Array(Language)?

  @[JSON::Field(key: "quality")]
  property quality : QualityModel

  @[JSON::Field(key: "customFormats", emit_null: true)]
  property custom_formats : Array(CustomFormatResource)?

  @[JSON::Field(key: "customFormatScore")]
  property custom_format_score : Int32

  @[JSON::Field(key: "size")]
  property size : Float64

  @[JSON::Field(key: "title", emit_null: true)]
  property title : String?

  @[JSON::Field(key: "estimatedCompletionTime", emit_null: true)]
  property estimated_completion_time : Time?

  @[JSON::Field(key: "added", emit_null: true)]
  property added : Time?

  @[JSON::Field(key: "status")]
  property status : Sonarr::QueueStatus

  @[JSON::Field(key: "trackedDownloadStatus")]
  property tracked_download_status : TrackedDownloadStatus

  @[JSON::Field(key: "trackedDownloadState")]
  property tracked_download_state : TrackedDownloadState

  @[JSON::Field(key: "statusMessages", emit_null: true)]
  property status_messages : Array(TrackedDownloadStatusMessage)?

  @[JSON::Field(key: "errorMessage", emit_null: true)]
  property error_message : String?

  @[JSON::Field(key: "downloadId", emit_null: true)]
  property download_id : String?

  @[JSON::Field(key: "protocol")]
  property protocol : Sonarr::DownloadProtocol

  @[JSON::Field(key: "downloadClient", emit_null: true)]
  property download_client : String?

  @[JSON::Field(key: "downloadClientHasPostImportCategory")]
  property download_client_has_post_import_category : Bool

  @[JSON::Field(key: "indexer", emit_null: true)]
  property indexer : String?

  @[JSON::Field(key: "outputPath", emit_null: true)]
  property output_path : String?

  @[JSON::Field(key: "episodeHasFile")]
  property episode_has_file : Bool

  @[JSON::Field(key: "sizeleft")]
  property sizeleft : Float64

  @[JSON::Field(key: "timeleft", emit_null: true)]
  property timeleft : String?

  def after_initialize
    series_id = self.series_id
    episode_id = self.episode_id

    self.episode = EpisodeResource.from_json(Sonarr::Client.get("/api/v3/episode/#{episode_id}"))
    self.series = SeriesResource.from_json(Sonarr::Client.get("/api/v3/series/#{series_id}"))
  end

  def self.all(page : Int32 = 1, page_size : Int32 = 10)
    self.from_json(Sonarr::Client.get("/api/v3/queue", {"page" => page.to_s, "pageSize" => page_size.to_s}))
  end

  def self.get(id : Int32)
    self.from_json(Sonarr::Client.get("/api/v3/queue/#{id}"))
  end
end
