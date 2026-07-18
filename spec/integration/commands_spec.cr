require "../integration_helper"

# GET /api/v3/command — Sonarr's command/task queue. A bare instance runs
# scheduled housekeeping commands, so this endpoint responds with a JSON array
# (possibly empty). Verifies reachability + shape without triggering anything
# that needs indexers or download clients.
describe "integration: commands list" do
  integration_it "returns a JSON array of commands" do
    resp = IntegrationHelper.get("/api/v3/command")
    resp.status_code.should eq(200)

    parsed = JSON.parse(resp.body)
    arr = parsed.as_a # raises if not an array — that is the assertion
    # If any command is present it carries a name; tolerate an empty queue.
    first = arr.first?
    first["name"].as_s.should_not be_empty if first
  end
end
