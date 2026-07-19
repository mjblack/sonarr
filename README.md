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
- **Generated typed endpoints** (`Sonarr::Api::*`) — one class per API group
  (e.g. `Sonarr::Api::Series`, `Sonarr::Api::Tag`), each with methods that
  issue the request and return already-deserialized models, so you don't have
  to call the generic client and parse JSON by hand.

Models, enums, and endpoints are all generated from `ext/schema.json`
(Sonarr's own OpenAPI document) rather than hand-written — see
[Generation](#generation) below.

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
client = Sonarr::Client.new("http://localhost:8989", "APIKEY")
```

### Typed endpoints

For every API group in the schema there's a `Sonarr::Api::<Group>` class:
construct it with the `Sonarr::Client` instance, then call a method — no
manual path-building or JSON parsing required. Methods return already
deserialized models (or `nil`/`[]` for empty/204 bodies).

System status:

```crystal
status = Sonarr::Api::System.new(client).list_status # => Sonarr::Model::SystemResource?
```

Since every model is nilable-by-default (mirroring the schema, which marks
almost nothing as strictly required), always guard against `nil` before using
a field:

```crystal
if version = status.try(&.version)
  puts "Sonarr #{version}"
end
```

Tag CRUD (`list` / `get(id)` / `create(body)` / `update(id, body)` / `delete(id)`):

```crystal
tags = Sonarr::Api::Tag.new(client)
all  = tags.list # => Array(Sonarr::Model::TagResource)

# Models have no keyword constructor (they're built for JSON round-tripping),
# so build one via #from_json and adjust properties as needed.
new_tag = Sonarr::Model::TagResource.from_json(%({"label": "4k"}))
created = tags.create(new_tag) # => Sonarr::Model::TagResource?

if id = created.try(&.id)
  fetched = tags.get(id) # => Sonarr::Model::TagResource?
  tags.delete(id)        # => Nil
end
```

A paged endpoint, e.g. the download queue — note this returns a
`*PagingResource` wrapper, not a bare array (see [Caveats](#caveats)):

```crystal
page = Sonarr::Api::Queue.new(client).list(page: 1, page_size: 25)
page.try(&.records) # => Array(Sonarr::Model::QueueResource)
```

#### Naming convention

`Sonarr::Api::<Group>` names come straight from the schema's path tags (e.g.
`/api/v3/tag` → `Sonarr::Api::Tag`); there are 66 groups covering the schema's
162 documented paths. Within a group, method names follow the HTTP verb and
path shape:

- `list` — `GET` on the collection path (e.g. `GET /api/v3/tag`).
- `get(id)` — `GET` on the collection path with an `/{id}` tail.
- `create(body)` — `POST` on the collection path.
- `update(id, body)` — `PUT` on the `/{id}` path.
- `delete(id)` — `DELETE` on the `/{id}` path.
- A sub-path tail becomes a suffix: `GET /api/v3/history/since` →
  `list_since`, `GET /api/v3/history/series` → `list_series`.
- Endpoints that don't fit the CRUD shape (no request body, or a verb-like
  path segment) are named after the verb: `POST /api/v3/system/restart` →
  `create_restart`, `POST /api/v3/system/shutdown` → `create_shutdown`.

Optional query parameters (filters, paging, `includeXxx` flags) are exposed
as keyword arguments in schema order, e.g. `Sonarr::Api::Series#list(tvdb_id:
nil, include_season_images: nil)`.

#### Caveats

- **Paged endpoints return a wrapper, not a bare array.** Endpoints whose
  schema response is a `*PagingResource` (queue, history, blocklist, log,
  missing, cutoff, import list exclusions) return that wrapper type — access
  the actual items via its `records` property, plus `page`, `pageSize`, and
  `totalRecords`. Unpaged list endpoints (e.g. `Sonarr::Api::Tag#list`,
  `Sonarr::Api::Series#list`) return a plain `Array(T)`.
- **A few endpoints are RPC-style, not CRUD.** Their method names are
  verb-derived rather than `list`/`get`/`create`/`update`/`delete` — e.g.
  `Sonarr::Api::System#create_restart`, `#create_shutdown`.
- **Some endpoints return no body** (`Nil`) — `delete` methods, and RPC-style
  actions like the ones above.
- **A handful of non-JSON paths are intentionally not generated**, since
  there's no JSON schema to type against: the calendar iCal feed
  (`/feed/v3/calendar/sonarr.ics`) and media cover images
  (`/api/v3/mediacover/{seriesId}/{filename}`). Use the
  [generic client](#generic-client) for those.

### Generic client

The lower-level `get`/`post`/`put`/`delete` methods that the typed endpoints
above are built on remain available directly, both on the instance and as
class methods on `Sonarr::Client` (which proxy to the singleton instance),
for anything not (yet) covered by a typed endpoint:

```crystal
body = Sonarr::Client.get("api/v3/system/status")

# Deserialize the response body into a generated model yourself.
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

## Generation

Model classes (`src/sonarr/model/*.cr`), enums (`src/sonarr/support_enums.cr`),
and typed endpoints (`src/sonarr/api/*.cr`) are all **generated, not
hand-written**, from `ext/schema.json` — Sonarr's own OpenAPI 3.0.0 document.
The generator lives at `tools/generate.cr`; endpoints are built from the
document's `paths`, one `Sonarr::Api::<Group>` class per path tag/group.

```sh
crystal run tools/generate.cr
```

This single command (re)writes every `src/sonarr/model/<snake_name>.cr` file,
the whole of `src/sonarr/support_enums.cr`, and every `src/sonarr/api/<snake_name>.cr`
file. Generation is deterministic and idempotent: running it twice against
the same schema produces no git diff.

To pick up a new Sonarr API version, drop the updated OpenAPI document in
place as `ext/schema.json` and regenerate:

```sh
cp /path/to/new/schema.json ext/schema.json
crystal run tools/generate.cr
```

Do not hand-edit files under `src/sonarr/model/`, `src/sonarr/support_enums.cr`,
or `src/sonarr/api/` — they carry an `AUTO-GENERATED ... DO NOT EDIT` header.
If a generated file needs fixing, fix the generator and regenerate. Genuine
per-model or per-endpoint customization belongs in a separate file that
reopens the class, never inside a generated file.

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
