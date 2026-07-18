class Sonarr::Model::MediaInfoResource < Sonarr::Model

  @[JSON::Field(key: "id", emit_null: true)]
  property id : Int32?

  @[JSON::Field(key: "audioBitrate")]
  property audio_bitrate : Int64

  @[JSON::Field(key: "audioChannels")]
  property audio_channels : Float64

  @[JSON::Field(key: "audioCodec", emit_null: true)]
  property audio_codec : String

  @[JSON::Field(key: "audioLanguages", emit_null: true)]
  property audio_languages : String

  @[JSON::Field(key: "audioStreamCount")]
  property audio_stream_count : Int32

  @[JSON::Field(key: "videoBitDepth")]
  property video_bit_depth : Int32

  @[JSON::Field(key: "videoBitrate")]
  property video_bitrate : Int64

  @[JSON::Field(key: "videoCodec", emit_null: true)]
  property video_codec : String

  @[JSON::Field(key: "videoFps")]
  property video_fps : Float64

  @[JSON::Field(key: "videoDynamicRange", emit_null: true)]
  property video_dynamic_range : String

  @[JSON::Field(key: "videoDynamicRangeType", emit_null: true)]
  property video_dynamic_range_type : String

  @[JSON::Field(key: "resolution", emit_null: true)]
  property resolution : String

  @[JSON::Field(key: "runTime", emit_null: true)]
  property run_time : String

  @[JSON::Field(key: "scanType", emit_null: true)]
  property scan_type : String

  @[JSON::Field(key: "subtitles", emit_null: true)]
  property subtitles : String

end
