require "../spec_helper"

describe Sonarr::Model::Field do
  it "parses JSON with all required fields" do
    json = %({
      "name": "testField",
      "label": "Test Field",
      "unit": "bytes",
      "helpText": "Help text",
      "helpLink": "http://example.com/help",
      "value": "test value",
      "type": "textbox",
      "advanced": false,
      "selectOptions": [{"value": "option1", "name": "Option 1"}],
      "selectOptionsProviderAction": "testAction",
      "section": "testSection",
      "hidden": "false",
      "placeholder": "Enter value"
    })
    field = Sonarr::Model::Field.from_json(json)
    field.name.should eq("testField")
    field.label.should eq("Test Field")
    field.unit.should eq("bytes")
    field.help_text.should eq("Help text")
    field.help_link.should eq("http://example.com/help")
    field.value.should eq("test value")
    field.type.should eq("textbox")
    field.advanced.should eq(false)
    field.select_options.should be_a(Array(Sonarr::Model::SelectOption))
    field.select_options_provider_action.should eq("testAction")
    field.section.should eq("testSection")
    field.hidden.should eq("false")
    field.placeholder.should eq("Enter value")
  end
end 