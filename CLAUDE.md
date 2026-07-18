# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project

`sonarr` is a Crystal shard: a typed client library for the **Sonarr API v3**. It provides model classes (JSON (de)serialization) and an HTTP client for talking to a Sonarr server.

- Source of truth for the API: **`ext/schema.json`** — the Sonarr OpenAPI 3.0.0 document (162 paths, 136 component schemas). When code and schema disagree, the schema wins.
- Language/toolchain: Crystal `>= 1.16.3` (dev on 1.20.x). HTTP via the `crest` shard.

## Architecture

- `src/sonarr.cr` — entrypoint: `Sonarr` module, `VERSION`, and (currently) enums. `require`s the client and models.
- `src/sonarr/model.cr` — abstract base `Sonarr::Model` (includes `JSON::Serializable` + `JSON::Serializable::Unmapped`); `require`s `./model/**`.
- `src/sonarr/model/*.cr` — one model per file, `class Sonarr::Model::XxxResource < Sonarr::Model`.
- `src/sonarr/client.cr` — `Sonarr::Client` (singleton) wrapping `crest`; generic `get/post/put/delete`. Typed endpoint methods are TODO.

### Models are GENERATED, not hand-edited
Model classes and enums are produced by a **schema-driven code generator** (a Crystal app under `tools/`, run with `crystal run tools/generate.cr`). A new Sonarr schema is applied by dropping in the new `ext/schema.json` and regenerating — never by hand-editing dozens of model files.

- Fix the **generator**, then regenerate. Do not hand-patch generated files (they carry an auto-generated header).
- Regeneration is idempotent: same schema in → zero diff out.
- Genuine per-model customization goes in a separate file that reopens the class, never inside a generated file.

### Model conventions (what the generator emits)
- `@[JSON::Field(key: "<exact schema property name>")]` on every property; snake_case Crystal names, camelCase JSON keys; `emit_null: true` on nilable/optional properties.
- Type map: int32→`Int32`, int64→`Int64`, number→`Float64`, string→`String`, bool→`Bool`, string+date-time→`Time`, array→`Array(T)`, `$ref`→referenced type.
- Nullability: schema-optional or `nullable: true` → nilable/`T?` or default; required+non-nullable → non-nilable.
- Enums under the `Sonarr` namespace, referenced as `Sonarr::EnumName`; mind string- vs integer-valued enums and value mapping.

## Commands

- Install deps: `shards install`
- Build check: `crystal build --no-codegen src/sonarr.cr`
- Format: `crystal tool format` (check: `crystal tool format --check`)
- Lint: `bin/ameba` (ameba is a development dependency; `shards install` builds `bin/ameba`)
- Unit specs: `crystal spec` (must stay green offline)
- Regenerate models: `crystal run tools/generate.cr`
- Integration specs (opt-in, needs Docker): `SONARR_INTEGRATION=1 crystal spec` with the Sonarr test container up (see below).

## Testing

- **Unit specs** (`spec/model/*.cr`): offline JSON round-trip against the schema shape. Cover required-only and fully-populated cases. `spec_helper.cr` = `require "spec"` + `require "../src/sonarr"`.
- **Integration specs** (`spec/integration/`): run against a **live Sonarr container** via `docker compose` (v2 is installed). Must be opt-in (guard by `SONARR_INTEGRATION=1`) and skip gracefully when the container/env is absent, so `crystal spec` stays green by default. A helper (`scripts/sonarr-testenv.sh` and/or `docker-compose.yml`) brings up `linuxserver/sonarr`, waits for health, and provides a known API key.

## Multi-agent workflow

Development is coordinated by a lead (the coordinator) that dispatches specialized subagents and owns all git/GitHub operations. **Subagents do not run git; the coordinator creates branches, commits, and opens/merges PRs.**

Subagents (`.claude/agents/`):
- **code-editor** — the generator and all `src/` library source (models are generated).
- **test-agent** — everything under `spec/` and the Docker integration harness.
- **doc-writer** — `README.md`, usage/API docs, `CHANGELOG.md`.
- **pr-reviewer** — read-only review of diffs/PRs for schema compliance, correctness, and coverage.

### GitHub / PR conventions
- Repo: `mjblack/sonarr` (remote `origin`, `master` is the default branch).
- Work is tracked by an **epic issue** plus focused per-subsystem issues; each lands as its own reviewed PR.
- Branch per issue (e.g. `feat/model-generator`, `fix/series-compliance`). Reference the issue in the PR; the pr-reviewer agent reviews before merge.

## Gotchas
- `shard.lock` is gitignored (this is a library).
- Enums currently live hand-written in `src/sonarr.cr`; the generator is expected to take these over.
- Some existing specs don't compile (nil-safety on nilable properties) — being fixed.
