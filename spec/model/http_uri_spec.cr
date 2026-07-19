require "../spec_helper"

describe Sonarr::Model::HttpUri do
  it "parses from the JSON string form Sonarr actually sends" do
    uri = Sonarr::Model::HttpUri.from_json(%("https://wiki.servarr.com/x"))
    uri.full_uri.should eq("https://wiki.servarr.com/x")
    uri.scheme.should eq("https")
    uri.host.should eq("wiki.servarr.com")
    uri.path.should eq("/x")
  end

  it "never raises on a malformed URL string" do
    uri = Sonarr::Model::HttpUri.from_json(%("::not a url::"))
    uri.full_uri.should eq("::not a url::")
  end

  it "parses from the object form the schema declares" do
    json = %({
      "fullUri": "https://example.com:8443/a?b=c#frag",
      "scheme": "https",
      "host": "example.com",
      "port": 8443,
      "path": "/a",
      "query": "b=c",
      "fragment": "frag"
    })
    uri = Sonarr::Model::HttpUri.from_json(json)
    uri.full_uri.should eq("https://example.com:8443/a?b=c#frag")
    uri.scheme.should eq("https")
    uri.host.should eq("example.com")
    uri.port.should eq(8443)
    uri.path.should eq("/a")
    uri.query.should eq("b=c")
    uri.fragment.should eq("frag")
  end

  it "serializes back to the bare string form" do
    uri = Sonarr::Model::HttpUri.from_json(%("https://wiki.servarr.com/x"))
    uri.to_json.should eq(%("https://wiki.servarr.com/x"))
  end

  it "round-trips within a HealthResource carrying a string wikiUrl" do
    json = %({"source": "X", "type": "warning", "message": "m", "wikiUrl": "https://wiki.servarr.com/x"})
    health = Sonarr::Model::HealthResource.from_json(json)
    health.source.should eq("X")
    health.wiki_url.try(&.full_uri).should eq("https://wiki.servarr.com/x")
  end

  it "reads a null wikiUrl as nil" do
    json = %({"source": "X", "type": "warning", "message": "m", "wikiUrl": null})
    health = Sonarr::Model::HealthResource.from_json(json)
    health.wiki_url.should be_nil
  end
end
