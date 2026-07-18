require "../spec_helper"

describe Sonarr::Model::SelectOption do
  it "parses JSON with all required fields" do
    json = %({
      "value": "option1",
      "name": "Option 1"
    })
    opt = Sonarr::Model::SelectOption.from_json(json)
    opt.value.should eq("option1")
    opt.name.should eq("Option 1")
  end
end 