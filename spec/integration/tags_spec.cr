require "../integration_helper"

# Full tag CRUD against a live Sonarr via the typed Api::Tag endpoints. Tags
# need no external indexers or download clients, so they are safe to exercise
# on a bare instance. Uses Sonarr::Model::TagResource throughout (typed request
# in, typed model out) and cleans up in an `ensure`.
describe "integration: Api::Tag CRUD" do
  integration_it "creates, reads, updates and deletes a tag with typed models" do
    tags = Sonarr::Api::Tag.new(IntegrationHelper.client)
    # Sonarr lowercases tag labels, so use a lowercase, unique label.
    label = "crystal-itest-#{Random.rand(1_000_000)}"

    # CREATE — typed request body, typed response.
    created = present(tags.create(Sonarr::Model::TagResource.from_json({label: label}.to_json)))
    created.label.should eq(label)
    id = present(created.id)
    id.should be > 0

    begin
      # READ (single)
      present(tags.get(id)).label.should eq(label)

      # READ (list) — the new tag must appear.
      tags.list.any? { |tag| tag.id == id }.should be_true

      # UPDATE — typed request body carrying the new label.
      new_label = "#{label}-upd"
      tags.update(id, Sonarr::Model::TagResource.from_json({id: id, label: new_label}.to_json))
      present(tags.get(id)).label.should eq(new_label)
    ensure
      # DELETE (cleanup) — must succeed and remove the tag.
      tags.delete(id)
      # Fetching a deleted tag returns 404, surfaced as a typed ApiError.
      error = expect_raises(Sonarr::ApiError) do
        tags.get(id)
      end
      error.status_code.should eq(404)
    end
  end
end
