require "../integration_helper"

# Full tag CRUD against a live Sonarr. Tags need no external indexers or
# download clients, so they are safe to exercise on a bare instance.
# Assertions stay on HTTP status + generic JSON to avoid coupling to the
# (being-regenerated) TagResource model API.
describe "integration: tags CRUD" do
  integration_it "creates, reads, updates and deletes a tag" do
    # Sonarr lowercases tag labels, so use a lowercase, unique label.
    label = "crystal-itest-#{Random.rand(1_000_000)}"

    # CREATE
    created = IntegrationHelper.post("/api/v3/tag", {label: label}.to_json)
    created.status_code.should eq(201)
    created_json = JSON.parse(created.body)
    created_json["label"].as_s.should eq(label)
    id = created_json["id"].as_i
    id.should be > 0

    begin
      # READ (single)
      one = IntegrationHelper.get("/api/v3/tag/#{id}")
      one.status_code.should eq(200)
      JSON.parse(one.body)["label"].as_s.should eq(label)

      # READ (list) — the new tag must appear.
      list = IntegrationHelper.get("/api/v3/tag")
      list.status_code.should eq(200)
      arr = JSON.parse(list.body).as_a
      arr.any? { |tag| tag["id"].as_i == id }.should be_true

      # UPDATE
      new_label = "#{label}-upd"
      updated = IntegrationHelper.put("/api/v3/tag/#{id}", {id: id, label: new_label}.to_json)
      # Sonarr returns 200 (older) or 202 (newer) on update; accept both.
      [200, 202].should contain(updated.status_code)
      check = IntegrationHelper.get("/api/v3/tag/#{id}")
      JSON.parse(check.body)["label"].as_s.should eq(new_label)
    ensure
      # DELETE (cleanup) — must succeed and remove the tag.
      deleted = IntegrationHelper.delete("/api/v3/tag/#{id}")
      [200, 202].should contain(deleted.status_code)
      gone = IntegrationHelper.get("/api/v3/tag/#{id}")
      gone.status_code.should eq(404)
    end
  end
end
