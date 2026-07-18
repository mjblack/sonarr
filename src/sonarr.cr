require "json"
require "crest"

module Sonarr
  VERSION = "0.1.0"

  enum DownloadProtocol
    Unknown
    Usenet
    Torrent
  end

  enum QualitySource
    Unknown
    Television
    TelevisionRaw
    Web
    WebRip
    DVD
    Bluray
    BlurayRaw
  end

  enum QueueStatus
    Unknown
    Queued
    Paused
    Downloading
    Completed
    Failed
    Warning
    Delay
    DownloadClientUnavailable
    Fallback
  end

  enum TrackedDownloadState
    Downloading
    ImportBlocked
    ImportPending
    Importing
    Imported
    FailedPending
    Failed
    Ignored
  end

  enum TrackedDownloadStatus
    Ok
    Warning
    Error
  end

  enum MonitorType
    Unknown
    All
    Future
    Missing
    Existing
    FirstSeason
    LastSeason
    LatestSeason
    Pilot
    Recent
    MonitorSpecials
    UnmonitorSpecials
    None
    Skip
  end

  enum ReleaseType
    Unknown
    SingleEpisode
    MultiEpisode
    SeasonPack
  end

  enum ApplyTags
    Add
    Remove
    Replace
  end

  enum AuthenticationRequiredType
    Enabled
    DisabledForLocalAddresses
  end

  enum AuthenticationType
    None
    Basic
    Forms
    External
  end

  enum BackupType
    Scheduled
    Manual
    Update
  end

  enum CertificateValidationType
    Enabled
    DisabledForLocalAddresses
    Disabled
  end

  enum CommandPriority
    Normal
    High
    Low
  end

  enum CommandResult
    Unknown
    Successful
    Unsuccessful
  end

  enum CommandStatus
    Queued
    Started
    Completed
    Failed
    Aborted
    Cancelled
    Orphaned
  end

  enum CommandTrigger
    Unspecified
    Manual
    Scheduled
  end

  enum DatabaseType
    SQLite
    PostgreSQL
  end

  enum EpisodeHistoryEventType
    Unknown
    Grabbed
    SeriesFolderImported
    DownloadFolderImported
    DownloadFailed
    EpisodeFileDeleted
    EpisodeFileRenamed
    DownloadIgnored
  end

  enum EpisodeTitleRequiredType
    Always
    BulkSeasonReleases
    Never
  end

  enum FileDateType
    None
    LocalAirDate
    UtcAirDate
  end

  enum HealthCheckResult
    Ok
    Notice
    Warning
    Error
  end

  enum ImportListType
    Program
    Plex
    Trakt
    Simkl
    Other
    Advanced
  end

  enum ListSyncLevelType
    Disabled
    LogOnly
    KeepAndUnmonitor
    KeepAndTag
  end

  enum MediaCoverTypes
    Unknown
    Poster
    Banner
    Fanart
    Screenshot
    Headshot
    Clearlogo
  end

  enum NewItemMonitorTypes
    All
    None
  end

  enum PrivacyLevel
    Normal
    Password
    ApiKey
    UserName
  end

  enum ProperDownloadTypes
    PreferAndUpgrade
    DoNotUpgrade
    DoNotPrefer
  end

  enum ProviderMessageType
    Info
    Warning
    Error
  end

  enum ProxyType
    Http
    Socks4
    Socks5
  end

  enum RejectionType
    Permanent
    Temporary
  end

  enum RescanAfterRefreshType
    Always
    AfterManual
    Never
  end

  enum RuntimeMode
    Console
    Service
    Tray
  end

  enum SeriesStatusType
    Continuing
    Ended
    Upcoming
    Deleted
  end

  enum SeriesTypes
    Standard
    Daily
    Anime
  end

  enum SortDirection
    Default
    Ascending
    Descending
  end

  enum UpdateMechanism
    BuiltIn
    Script
    External
    Apt
    Docker
  end

end

require "./sonarr/client"
require "./sonarr/model"