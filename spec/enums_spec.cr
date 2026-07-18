require "./spec_helper"

# The generated enums serialize to the exact camelCase values declared in
# `ext/schema.json` (Crystal's default would emit snake_case), and read
# leniently so both the schema value and case-insensitive variants parse.
describe "Sonarr string enums" do
  describe "camelCase serialization (writes)" do
    it "emits the schema value for multi-word members" do
      Sonarr::DatabaseType::PostgreSQL.to_json.should eq(%("postgreSQL"))
      Sonarr::DatabaseType::SqLite.to_json.should eq(%("sqLite"))
      Sonarr::MonitorTypes::FirstSeason.to_json.should eq(%("firstSeason"))
      Sonarr::MonitorTypes::LatestSeason.to_json.should eq(%("latestSeason"))
      Sonarr::QualitySource::WebRip.to_json.should eq(%("webRip"))
      Sonarr::UpdateMechanism::BuiltIn.to_json.should eq(%("builtIn"))
      Sonarr::MediaCoverTypes::Clearlogo.to_json.should eq(%("clearlogo"))
      Sonarr::ListSyncLevelType::KeepAndUnmonitor.to_json.should eq(%("keepAndUnmonitor"))
      Sonarr::TrackedDownloadState::ImportBlocked.to_json.should eq(%("importBlocked"))
      Sonarr::SeriesStatusType::Continuing.to_json.should eq(%("continuing"))
    end

    it "exposes the schema value via to_sonarr_value" do
      Sonarr::DatabaseType::PostgreSQL.to_sonarr_value.should eq("postgreSQL")
      Sonarr::ApplyTags::Replace.to_sonarr_value.should eq("replace")
    end
  end

  describe "lenient parsing (reads)" do
    it "parses the exact schema value" do
      Sonarr::DatabaseType.from_json(%("postgreSQL")).should eq(Sonarr::DatabaseType::PostgreSQL)
      Sonarr::MonitorTypes.from_json(%("firstSeason")).should eq(Sonarr::MonitorTypes::FirstSeason)
    end

    it "parses case-insensitive / snake variants" do
      Sonarr::DatabaseType.from_json(%("sqlite")).should eq(Sonarr::DatabaseType::SqLite)
      Sonarr::RuntimeMode.from_json(%("Console")).should eq(Sonarr::RuntimeMode::Console)
    end

    it "raises a JSON::ParseException on unknown values" do
      expect_raises(JSON::ParseException) do
        Sonarr::DatabaseType.from_json(%("mysql"))
      end
    end

    it "round-trips through JSON" do
      Sonarr::QualitySource.from_json(Sonarr::QualitySource::BlurayRaw.to_json)
        .should eq(Sonarr::QualitySource::BlurayRaw)
    end
  end
end
