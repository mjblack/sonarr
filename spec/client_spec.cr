require "./spec_helper"

# Unit specs for the hand-written client core (Epic B1). These exercise ONLY
# pure, offline logic — query/paging construction, request-body serialization,
# response deserialization, and typed error construction. Actual HTTP is
# covered by the integration specs (Epic B4).

# A tiny model used to prove typed (de)serialization without pulling in a
# generated resource.
private class SampleModel
  include JSON::Serializable

  property id : Int32
  property name : String

  def initialize(@id : Int32, @name : String)
  end
end

describe Sonarr::Query do
  describe "paging" do
    it "renders the standard paging parameters in order" do
      Sonarr::Query.paging(page: 2, page_size: 50, sort_key: "date").to_s
        .should eq("page=2&pageSize=50&sortKey=date")
    end

    it "drops nil paging parameters" do
      Sonarr::Query.paging(page: 1).to_s.should eq("page=1")
    end

    it "serializes an enum sort direction via its schema value" do
      query = Sonarr::Query.paging(sort_key: "date", sort_direction: Sonarr::SortDirection::Descending)
      query.to_s.should eq("sortKey=date&sortDirection=descending")
    end
  end

  describe "#add" do
    it "expands array values into repeated keys" do
      Sonarr::Query.new.add("seriesIds", [1, 2, 3]).to_s
        .should eq("seriesIds=1&seriesIds=2&seriesIds=3")
    end

    it "drops nil values" do
      Sonarr::Query.new.add("foo", nil).empty?.should be_true
    end

    it "URI-encodes keys and values" do
      Sonarr::Query.new.add("term", "a b&c").to_s.should eq("term=a+b%26c")
    end

    it "is chainable and preserves insertion order" do
      Sonarr::Query.new.add("a", 1).add("b", "x").to_s.should eq("a=1&b=x")
    end

    it "serializes Time values as RFC 3339" do
      t = Time.utc(2024, 1, 2, 3, 4, 5)
      Sonarr::Query.new.add("since", t).to_s.should eq("since=#{URI.encode_www_form(t.to_rfc3339)}")
    end
  end

  describe ".from" do
    it "builds from a plain string hash" do
      Sonarr::Query.from({"a" => "1", "b" => "2"}).to_s.should eq("a=1&b=2")
    end

    it "is empty for an empty hash" do
      Sonarr::Query.from({} of String => String).empty?.should be_true
    end
  end

  describe ".build" do
    it "yields a query for block construction" do
      query = Sonarr::Query.build do |builder|
        builder.add("page", 1)
        builder.add("tags", [4, 5])
      end
      query.to_s.should eq("page=1&tags=4&tags=5")
    end
  end
end

describe "Sonarr::Client body serialization" do
  it "returns nil for a nil body" do
    Sonarr::Client.encode_body(nil).should be_nil
  end

  it "passes a String body through unchanged" do
    Sonarr::Client.encode_body(%({"raw":true})).should eq(%({"raw":true}))
  end

  it "serializes a JSON::Serializable model" do
    Sonarr::Client.encode_body(SampleModel.new(7, "x")).should eq(%({"id":7,"name":"x"}))
  end

  it "serializes an array of models" do
    body = Sonarr::Client.encode_body([SampleModel.new(1, "a"), SampleModel.new(2, "b")])
    body.should eq(%([{"id":1,"name":"a"},{"id":2,"name":"b"}]))
  end
end

describe "Sonarr::Client typed deserialization" do
  describe ".deserialize_one" do
    it "parses a single object" do
      model = present(Sonarr::Client.deserialize_one(%({"id":9,"name":"z"}), SampleModel))
      model.id.should eq(9)
      model.name.should eq("z")
    end

    it "returns nil for a nil body (e.g. 204)" do
      Sonarr::Client.deserialize_one(nil, SampleModel).should be_nil
    end

    it "returns nil for a blank body" do
      Sonarr::Client.deserialize_one("   ", SampleModel).should be_nil
    end
  end

  describe ".deserialize_many" do
    it "parses a JSON array" do
      models = Sonarr::Client.deserialize_many(%([{"id":1,"name":"a"},{"id":2,"name":"b"}]), SampleModel)
      models.size.should eq(2)
      models.map(&.id).should eq([1, 2])
    end

    it "returns an empty array for a nil body" do
      Sonarr::Client.deserialize_many(nil, SampleModel).should eq([] of SampleModel)
    end

    it "returns an empty array for a blank body" do
      Sonarr::Client.deserialize_many("", SampleModel).should eq([] of SampleModel)
    end
  end
end

describe Sonarr::ApiError do
  it "carries the status code and body" do
    error = Sonarr::ApiError.new(404, %({"message":"Not Found"}))
    error.status_code.should eq(404)
    error.body.should eq(%({"message":"Not Found"}))
  end

  it "builds a helpful default message including the body" do
    error = Sonarr::ApiError.new(400, "bad request")
    message = present(error.message)
    message.should contain("HTTP 400")
    message.should contain("bad request")
  end

  it "honours a custom message" do
    error = Sonarr::ApiError.new(500, "boom", "custom")
    error.message.should eq("custom")
  end

  it "is a Sonarr::Error" do
    Sonarr::ApiError.new(500, "").should be_a(Sonarr::Error)
  end

  it "wraps a crest RequestFailed" do
    http_res = HTTP::Client::Response.new(422, body: %({"message":"Unprocessable"}))
    response = Crest::Response.new(http_res, Crest::Request.new(:post, "http://localhost/api"))
    error = Sonarr::ApiError.from_request_failed(Crest::RequestFailed.new(response))
    error.status_code.should eq(422)
    error.body.should eq(%({"message":"Unprocessable"}))
  end
end
