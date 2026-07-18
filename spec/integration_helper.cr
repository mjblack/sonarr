# ameba:disable Lint/SpecFilename — this is a shared helper, not a spec file.
require "./spec_helper"
require "http/client"
require "json"

# Shared helper for the opt-in integration specs (Epic A / A6).
#
# The integration specs under spec/integration/ run against a LIVE Sonarr
# container brought up by scripts/sonarr-testenv.sh / docker-compose.yml. They
# are opt-in and must never break a plain, offline `crystal spec`:
#
#   * Set SONARR_INTEGRATION=1 to actually exercise them.
#   * When the env var is unset, OR the container is not reachable, the specs
#     are reported as `pending` with a clear message instead of failing.
#
# Base URL and API key are read from the environment, defaulting to the values
# seeded by the harness (docker-compose.yml + scripts/sonarr-testenv.sh):
#
#   SONARR_URL      (default http://localhost:8989)
#   SONARR_API_KEY  (default 0123456789abcdef0123456789abcdef)
module IntegrationHelper
  DEFAULT_URL     = "http://localhost:8989"
  DEFAULT_API_KEY = "0123456789abcdef0123456789abcdef"

  class_getter base_url : String = (ENV["SONARR_URL"]?.presence || DEFAULT_URL).rchop('/')
  class_getter api_key : String = ENV["SONARR_API_KEY"]?.presence || DEFAULT_API_KEY

  # Opt-in switch. Integration specs only truly run when this is "1".
  def self.enabled? : Bool
    ENV["SONARR_INTEGRATION"]? == "1"
  end

  # Cheap liveness probe against /ping. Cached so we probe at most once.
  @@reachable : Bool? = nil

  def self.reachable? : Bool
    cached = @@reachable
    return cached unless cached.nil?
    @@reachable = probe
  end

  private def self.probe : Bool
    uri = URI.parse(base_url)
    client = HTTP::Client.new(uri)
    client.connect_timeout = 2.seconds
    client.read_timeout = 3.seconds
    begin
      resp = client.get("/ping")
      resp.status.success?
    ensure
      client.close
    end
  rescue
    false
  end

  # True only when the specs should actually hit the server.
  def self.run? : Bool
    enabled? && reachable?
  end

  # Human-readable reason the specs are being skipped (nil when they run).
  def self.skip_reason : String?
    return nil if run?
    if enabled?
      "Sonarr not reachable at #{base_url} — start it with scripts/sonarr-testenv.sh up && scripts/sonarr-testenv.sh wait"
    else
      "set SONARR_INTEGRATION=1 (and start the container: scripts/sonarr-testenv.sh up && scripts/sonarr-testenv.sh wait)"
    end
  end

  # ---- HTTP plumbing -------------------------------------------------------
  #
  # Direct JSON requests with the X-Api-Key header. Deliberately NOT coupled to
  # the (currently-being-regenerated) model API; specs assert on HTTP status +
  # parsed JSON, deserializing only into clearly-stable models where useful.

  def self.headers : HTTP::Headers
    HTTP::Headers{
      "X-Api-Key"    => api_key,
      "Accept"       => "application/json",
      "Content-Type" => "application/json",
    }
  end

  def self.request(method : String, path : String, body : String? = nil) : HTTP::Client::Response
    uri = URI.parse(base_url)
    client = HTTP::Client.new(uri)
    client.connect_timeout = 5.seconds
    client.read_timeout = 15.seconds
    begin
      client.exec(method, path, headers: headers, body: body)
    ensure
      client.close
    end
  end

  def self.get(path : String) : HTTP::Client::Response
    request("GET", path)
  end

  def self.post(path : String, body : String) : HTTP::Client::Response
    request("POST", path, body)
  end

  def self.put(path : String, body : String) : HTTP::Client::Response
    request("PUT", path, body)
  end

  def self.delete(path : String) : HTTP::Client::Response
    request("DELETE", path)
  end
end

# Wrapper around Spec's `it` that runs the example only when the integration
# environment is available, and otherwise records a `pending` example carrying
# the skip reason. Keeps `crystal spec` green and Docker-free by default.
def integration_it(description : String, &block)
  if IntegrationHelper.run?
    it(description, &block)
  else
    pending("#{description} [skipped: #{IntegrationHelper.skip_reason}]", &block)
  end
end
