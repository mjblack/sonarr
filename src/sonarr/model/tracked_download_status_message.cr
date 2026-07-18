class Sonarr::Model::TrackedDownloadStatusMessage < Sonarr::Model

  @[JSON::Field(emit_nil: true)]
  property title : String?

  @[JSON::Field(emit_nil: true)]
  property messages = [] of String

end
