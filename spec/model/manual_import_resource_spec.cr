require "../spec_helper"

describe Sonarr::Model::ManualImportResource do
  it "parses an empty object (arrays default to empty)" do
    import = Sonarr::Model::ManualImportResource.from_json("{}")
    import.id.should be_nil
    import.series.should be_nil
    import.quality.should be_nil
    import.episodes.should be_empty
    import.rejections.should be_empty
  end

  it "parses a fully-populated object" do
    json = %({
      "id": 1,
      "path": "/path/to/file.mkv",
      "relativePath": "file.mkv",
      "folderName": "Test Folder",
      "name": "Test File",
      "size": 123456,
      "series": #{SpecFixtures.series_json},
      "episodes": [#{SpecFixtures.episode_json}],
      "quality": #{SpecFixtures.quality_model_json},
      "languages": [{"id": 1, "name": "English"}],
      "rejections": [{"type": "permanent", "reason": "bad"}]
    })
    import = Sonarr::Model::ManualImportResource.from_json(json)
    import.id.should eq(1)
    import.path.should eq("/path/to/file.mkv")
    import.relative_path.should eq("file.mkv")
    import.folder_name.should eq("Test Folder")
    import.name.should eq("Test File")
    import.size.should eq(123456)
    present(import.series).id.should eq(2)
    import.episodes.size.should eq(1)
    present(present(import.quality).quality).id.should eq(1)
    import.languages.size.should eq(1)
    import.rejections.size.should eq(1)
    import.rejections.first.type_field.should eq(Sonarr::RejectionType::Permanent)
  end
end
