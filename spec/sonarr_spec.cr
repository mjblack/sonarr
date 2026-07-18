require "./spec_helper"

describe Sonarr do
  it "exposes a version string" do
    Sonarr::VERSION.should be_a(String)
    Sonarr::VERSION.should_not be_empty
  end
end
