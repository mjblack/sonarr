# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

Epic A: bring the model layer into full compliance with the Sonarr v3 OpenAPI
schema (`ext/schema.json`), and add a repeatable integration test harness.

### Added

- Schema-driven code generator (`tools/generate.cr`): reads
  `ext/schema.json` and (re)writes one `Sonarr::Model::*` class per object
  schema under `src/sonarr/model/`, plus every enum schema into
  `src/sonarr/support_enums.cr`. Deterministic and idempotent — the same
  schema regenerates with no diff.
- All 100 model classes and 36 enums in the current schema are now generated,
  replacing the previous hand-written/partial set.
- `Sonarr::TimeConverter` (`src/sonarr/support.cr`): converts `date-time`
  schema properties to/from Crystal `Time`, tolerant of the several timestamp
  formats Sonarr emits (RFC 3339 with `Z`/offset, timezone-less "unset"
  values) and normalizing writes to RFC 3339.
- `def_string_enum` macro (`src/sonarr/support.cr`): generates enums whose
  JSON serialization is the exact `camelCase` value declared in the schema,
  with lenient parsing on read.
- Docker-driven integration test harness: `docker-compose.yml` +
  `scripts/sonarr-testenv.sh` (`up`/`wait`/`apikey`/`url`/`status`/`down`)
  bring up a `linuxserver/sonarr` container with a deterministic, pre-seeded
  API key. Opt-in specs under `spec/integration/` (guarded by
  `SONARR_INTEGRATION=1`) exercise system status, series, tags CRUD, quality
  profiles, and the command queue against the live container; they report as
  `pending` and are skipped when the environment isn't up, so a plain
  `crystal spec` stays green and Docker-free.
- `ameba` added as a development dependency for linting (`bin/ameba`).

### Changed

- Enum JSON serialization no longer uses Crystal's default snake_case
  `Enum#to_json` output, which the Sonarr API rejected on writes; enums now
  round-trip using the schema's literal camelCase strings.
- Model properties are nilable/non-nilable per the schema's `required` and
  `nullable` semantics instead of being uniformly optional or guessed.
- `date-time`-typed properties are typed as `Time` (via `Sonarr::TimeConverter`)
  instead of `String`.

[Unreleased]: https://github.com/mjblack/sonarr/compare/25d2918...HEAD
