require "spec"
require "../src/sonarr"

# Unwraps a nilable value, failing the example (at the caller) if it is nil.
#
# Every generated model property is nilable (`T?`), so specs constantly need to
# assert a value is present before drilling into it. `present` keeps that
# concise while still producing a clear spec failure on an unexpected nil.
def present(value : T?, file = __FILE__, line = __LINE__) : T forall T
  value.should_not(be_nil, file: file, line: line)
  value.not_nil! # ameba:disable Lint/NotNil
end

# Shared JSON fixtures for the model specs.
#
# The models are generated from `ext/schema.json` with every property nilable,
# so these fixtures build up valid, fully-shaped nested objects that individual
# specs can embed without repeating large literals.
module SpecFixtures
  extend self

  # A `QualityModel` (nested `quality` + `revision`).
  def quality_model_json : String
    <<-JSON
    {"quality": {"id": 1, "name": "HDTV", "source": "web", "resolution": 1080}, "revision": {"version": 1, "real": 0, "isRepack": false}}
    JSON
  end

  # A `SeriesResource` with statistics/ratings/language populated.
  def series_json : String
    <<-JSON
    {"id": 2, "title": "Test Series", "status": "continuing", "ended": false, "year": 2020, "qualityProfileId": 1, "seasonFolder": true, "monitored": true, "monitorNewItems": "all", "useSceneNumbering": false, "runtime": 45, "tvdbId": 12345, "tvRageId": 67890, "tvMazeId": 11111, "tmdbId": 22222, "seriesType": "standard", "added": "2020-01-01T12:00:00Z", "originalLanguage": {"id": 1, "name": "English"}, "ratings": {"votes": 100, "value": 8.5}, "statistics": {"seasonCount": 1, "episodeFileCount": 10, "episodeCount": 10, "totalEpisodeCount": 10, "sizeOnDisk": 1024, "percentOfEpisodes": 100.0}, "addOptions": {"ignoreEpisodesWithFiles": false, "ignoreEpisodesWithoutFiles": false, "monitor": "unknown", "searchForMissingEpisodes": false, "searchForCutoffUnmetEpisodes": false}}
    JSON
  end

  # An `EpisodeResource`.
  def episode_json : String
    <<-JSON
    {"id": 3, "seriesId": 2, "tvdbId": 3, "episodeFileId": 4, "seasonNumber": 1, "episodeNumber": 2, "title": "Pilot", "airDate": "2023-01-01", "airDateUtc": "2023-01-01T12:00:00Z", "runtime": 45, "hasFile": true, "monitored": true}
    JSON
  end
end
