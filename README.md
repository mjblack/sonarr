# sonarr

A Crystal shard for talking to the [Sonarr](https://sonarr.tv/) API v3.

It provides:

- **Generated model classes** (`Sonarr::Model::*`) for every object schema in the
  Sonarr v3 OpenAPI document — JSON (de)serialization via `JSON::Serializable`,
  with correct nilability, `camelCase` JSON keys, and `Time` conversion for
  `date-time` properties.
- **Generated enums** (`Sonarr::*`) for every enum schema, serializing to the
  exact `camelCase` string values the Sonarr API expects.
- A small **HTTP client** (`Sonarr::Client`) wrapping [`crest`](https://github.com/mamantoha/crest)
  that handles the base URL and `X-Api-Key` header for you.

Models and enums are generated from `ext/schema.json` (Sonarr's own OpenAPI
document) rather than hand-written — see [Model generation](#model-generation)
below.

**Status:** the HTTP client currently only exposes generic
`get`/`post`/`put`/`delete` methods — there are no typed, per-endpoint methods
(e.g. no `client.series` or `client.system_status`) yet. Typed endpoint
methods built on top of the generated models are planned (see the project's
Epic B). Until then, you call the generic client and deserialize the response
body into the model you want yourself, as shown below.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     sonarr:
       github: mjblack/sonarr
   ```

2. Run `shards install`

## Usage

### Quick start

```crystal
require "sonarr"

# Sonarr::Client is a singleton: `.new` configures the shared instance and
# also returns it.
Sonarr::Client.new("http://localhost:8989", "APIKEY")

# Generic HTTP verbs are available both on the instance and as class methods
# on Sonarr::Client (they proxy to the singleton instance).
body = Sonarr::Client.get("api/v3/system/status")

# Deserialize the response body into a generated model.
status = Sonarr::Model::SystemResource.from_json(body)
status.app_name  # => "Sonarr"
status.version   # => "4.0.x.xxxx"
```

`get`/`post`/`put`/`delete` all take a path and an optional
`params : Hash(String, String)` of query parameters, and return the raw
response body as a `String`. The `apikey` query parameter is added
automatically. For example, listing series:

```crystal
body   = Sonarr::Client.get("api/v3/series")
series = Array(Sonarr::Model::SeriesResource).from_json(body)
```

Since every model is nilable-by-default (mirroring the schema, which marks
almost nothing as strictly required), always guard against `nil` before using
a field:

```crystal
if version = status.version
  puts "Sonarr #{version}"
end
```

### Enums

Enum schemas (e.g. `Sonarr::CommandStatus`, `Sonarr::DatabaseType`) live under
the `Sonarr` namespace, not `Sonarr::Model`. They serialize to and parse from
the exact `camelCase` string Sonarr uses on the wire (not Crystal's default
snake_case `Enum#to_json`), so round-tripping a model that contains one just
works:

```crystal
status.database_type # => Sonarr::DatabaseType::SqLite
status.database_type.try(&.to_sonarr_value) # => "sqLite"
```

## Development

- Install dependencies: `shards install`
- Run the unit specs: `crystal spec`
- Format code: `crystal tool format` (check only: `crystal tool format --check`)
- Lint: `bin/ameba` (built by `shards install` as a development dependency)

## Model generation

Model classes (`src/sonarr/model/*.cr`) and enums (`src/sonarr/support_enums.cr`)
are **generated, not hand-written**, from `ext/schema.json` — Sonarr's own
OpenAPI 3.0.0 document. The generator lives at `tools/generate.cr`.

```sh
crystal run tools/generate.cr
```

This (re)writes every `src/sonarr/model/<snake_name>.cr` file and the whole
of `src/sonarr/support_enums.cr`. Generation is deterministic and idempotent:
running it twice against the same schema produces no git diff.

To pick up a new Sonarr API version, drop the updated OpenAPI document in
place as `ext/schema.json` and regenerate:

```sh
cp /path/to/new/schema.json ext/schema.json
crystal run tools/generate.cr
```

Do not hand-edit files under `src/sonarr/model/` or `src/sonarr/support_enums.cr`
— they carry an `AUTO-GENERATED ... DO NOT EDIT` header. If a generated file
needs fixing, fix the generator and regenerate. Genuine per-model
customization belongs in a separate file that reopens the class, never inside
a generated file.

## Docker integration tests

Unit specs (`spec/model/*.cr`) run fully offline against fixture JSON and are
part of the default `crystal spec` run. Integration specs
(`spec/integration/*.cr`) exercise a **live Sonarr container** and are opt-in
— they're skipped (reported as `pending`) unless explicitly enabled, so a
plain `crystal spec` stays green and Docker-free.

`docker-compose.yml` and `scripts/sonarr-testenv.sh` bring up a single
`linuxserver/sonarr` container with a deterministic, pre-seeded API key so
the specs are reproducible. Bring the environment up, wait for it to be
healthy, run the integration specs, then tear it down:

```sh
scripts/sonarr-testenv.sh up
scripts/sonarr-testenv.sh wait
SONARR_INTEGRATION=1 crystal spec spec/integration/
scripts/sonarr-testenv.sh down
```

Other `sonarr-testenv.sh` subcommands:

- `apikey` — print the API key currently in use (read back from the live
  `config.xml` if present, otherwise the seeded default)
- `url` — print the base URL the container is published on
- `status` — `docker compose ps` for the environment

Everything is tunable via environment variables (defaults shown, kept in sync
between `docker-compose.yml`, `scripts/sonarr-testenv.sh`, and
`spec/integration_helper.cr`):

| Variable              | Default                              | Meaning                                |
|-----------------------|---------------------------------------|-----------------------------------------|
| `SONARR_PORT`         | `8989`                                | Host port the container is published on |
| `SONARR_API_KEY`      | `0123456789abcdef0123456789abcdef`    | API key seeded into `config.xml`        |
| `SONARR_CONFIG_DIR`   | `/tmp/sonarr-testenv-config`          | Host dir bind-mounted at `/config`      |
| `SONARR_PUID`/`SONARR_PGID` | current user (script) / `1000` (compose) | Ownership of the config dir  |
| `SONARR_WAIT_TIMEOUT` | `180`                                  | Seconds `wait` polls before failing     |
| `SONARR_URL`          | `http://localhost:${SONARR_PORT}`     | Base URL used by `wait` and the specs   |
| `SONARR_INTEGRATION`  | unset                                  | Set to `1` to actually run the specs    |

`scripts/sonarr-testenv.sh down` runs `docker compose down -v` and removes the
ephemeral config directory.

## Contributing

1. Fork it (<https://github.com/mjblack/sonarr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew J. Black](https://github.com/mjblack) - creator and maintainer
