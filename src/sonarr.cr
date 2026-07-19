require "json"
require "crest"

module Sonarr
  VERSION = "0.1.0"
end

require "./sonarr/support"
require "./sonarr/support_enums"
require "./sonarr/error"
require "./sonarr/query"
require "./sonarr/client"
require "./sonarr/model"
require "./sonarr/support_http_uri"
require "./sonarr/api/**"
