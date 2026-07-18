#!/usr/bin/env bash
#
# sonarr-testenv.sh — manage the Docker-driven Sonarr integration test environment.
#
# Epic A / issue A6. Drives docker-compose.yml at the repo root to bring up a
# live linuxserver/sonarr instance with a DETERMINISTIC, pre-seeded API key so
# the opt-in specs under spec/integration/ are reproducible.
#
# Subcommands:
#   up      Seed config.xml (fixed <ApiKey>) if absent, then `docker compose up -d`.
#   wait    Poll <URL>/ping until healthy, or fail after a timeout.
#   apikey  Print the API key (read back from the live config.xml if present,
#           otherwise the seeded default).
#   down    `docker compose down -v` and remove the ephemeral config dir.
#   url     Print the base URL the container is published on.
#   status  Show `docker compose ps` for the environment.
#
# Everything works with the stock `docker` / `docker compose` (v2) CLI only.
#
# Environment overrides (defaults match spec/integration_helper.cr):
#   SONARR_PORT        host port                       (default 8989)
#   SONARR_API_KEY     32-char API key to seed         (default 0123456789abcdef0123456789abcdef)
#   SONARR_CONFIG_DIR  host dir bind-mounted at /config (default /tmp/sonarr-testenv-config)
#   SONARR_PUID/PGID   ownership of the config dir      (default: current user)
#   SONARR_WAIT_TIMEOUT seconds to wait in `wait`       (default 180)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/docker-compose.yml"

# ---- configuration (with defaults kept in sync with the compose file/helper) ----
SONARR_PORT="${SONARR_PORT:-8989}"
SONARR_API_KEY="${SONARR_API_KEY:-0123456789abcdef0123456789abcdef}"
SONARR_CONFIG_DIR="${SONARR_CONFIG_DIR:-/tmp/sonarr-testenv-config}"
SONARR_PUID="${SONARR_PUID:-$(id -u)}"
SONARR_PGID="${SONARR_PGID:-$(id -g)}"
SONARR_WAIT_TIMEOUT="${SONARR_WAIT_TIMEOUT:-180}"
SONARR_URL="${SONARR_URL:-http://localhost:${SONARR_PORT}}"

export SONARR_PORT SONARR_CONFIG_DIR SONARR_PUID SONARR_PGID TZ="${TZ:-Etc/UTC}"

log() { printf '[sonarr-testenv] %s\n' "$*" >&2; }
die() { log "ERROR: $*"; exit 1; }

compose() { docker compose -f "${COMPOSE_FILE}" "$@"; }

# --------------------------------------------------------------------------- #
# Write a minimal, valid Sonarr config.xml carrying the fixed API key. Sonarr
# preserves an existing <ApiKey> across boots, which makes the key deterministic
# for the specs. Authentication is set to External so the web UI does not block
# and the API is reachable with the X-Api-Key header.
# --------------------------------------------------------------------------- #
seed_config() {
  mkdir -p "${SONARR_CONFIG_DIR}"
  local cfg="${SONARR_CONFIG_DIR}/config.xml"
  if [[ -f "${cfg}" ]]; then
    log "config.xml already present at ${cfg} (leaving as-is)"
    return 0
  fi
  log "seeding ${cfg} with API key ${SONARR_API_KEY}"
  cat > "${cfg}" <<EOF
<Config>
  <BindAddress>*</BindAddress>
  <Port>8989</Port>
  <SslPort>9898</SslPort>
  <EnableSsl>False</EnableSsl>
  <LaunchBrowser>False</LaunchBrowser>
  <ApiKey>${SONARR_API_KEY}</ApiKey>
  <AuthenticationMethod>External</AuthenticationMethod>
  <AuthenticationRequired>DisabledForLocalAddresses</AuthenticationRequired>
  <Branch>main</Branch>
  <LogLevel>info</LogLevel>
  <SslCertPath></SslCertPath>
  <UrlBase></UrlBase>
  <InstanceName>Sonarr</InstanceName>
  <UpdateMechanism>Docker</UpdateMechanism>
  <AnalyticsEnabled>False</AnalyticsEnabled>
</Config>
EOF
  # Best-effort ownership match for the linuxserver PUID/PGID.
  chown "${SONARR_PUID}:${SONARR_PGID}" "${cfg}" 2>/dev/null || true
}

cmd_up() {
  [[ -f "${COMPOSE_FILE}" ]] || die "compose file not found: ${COMPOSE_FILE}"
  seed_config
  log "starting container (port ${SONARR_PORT}, config ${SONARR_CONFIG_DIR})"
  compose up -d
  log "container started; run '$(basename "$0") wait' to block until healthy"
}

cmd_wait() {
  local deadline=$(( $(date +%s) + SONARR_WAIT_TIMEOUT ))
  log "waiting up to ${SONARR_WAIT_TIMEOUT}s for ${SONARR_URL}/ping ..."
  while true; do
    if curl -fsS -m 3 "${SONARR_URL}/ping" >/dev/null 2>&1; then
      log "Sonarr is up at ${SONARR_URL}"
      return 0
    fi
    if (( $(date +%s) >= deadline )); then
      log "timed out; recent container logs:"
      compose logs --tail 40 sonarr >&2 || true
      die "Sonarr did not become healthy within ${SONARR_WAIT_TIMEOUT}s"
    fi
    sleep 3
  done
}

cmd_apikey() {
  local cfg="${SONARR_CONFIG_DIR}/config.xml"
  if [[ -f "${cfg}" ]]; then
    # Read the key actually in use, in case Sonarr regenerated it.
    local key
    key="$(sed -n 's:.*<ApiKey>\(.*\)</ApiKey>.*:\1:p' "${cfg}" | head -n1)"
    if [[ -n "${key}" ]]; then
      printf '%s\n' "${key}"
      return 0
    fi
  fi
  printf '%s\n' "${SONARR_API_KEY}"
}

cmd_url() { printf '%s\n' "${SONARR_URL}"; }

cmd_status() { compose ps; }

cmd_down() {
  log "stopping and removing container + volumes"
  compose down -v || true
  if [[ -n "${SONARR_CONFIG_DIR}" && -d "${SONARR_CONFIG_DIR}" ]]; then
    log "removing ephemeral config dir ${SONARR_CONFIG_DIR}"
    rm -rf "${SONARR_CONFIG_DIR}"
  fi
}

usage() {
  cat >&2 <<EOF
Usage: $(basename "$0") <up|wait|apikey|url|status|down>

  up      seed a fixed API key and start the Sonarr container (detached)
  wait    block until ${SONARR_URL}/ping responds (timeout ${SONARR_WAIT_TIMEOUT}s)
  apikey  print the API key in use
  url     print the base URL (${SONARR_URL})
  status  docker compose ps
  down    stop the container, drop volumes, remove the config dir
EOF
  exit 64
}

main() {
  local sub="${1:-}"
  [[ $# -gt 0 ]] && shift || true
  case "${sub}" in
    up)     cmd_up "$@" ;;
    wait)   cmd_wait "$@" ;;
    apikey) cmd_apikey "$@" ;;
    url)    cmd_url "$@" ;;
    status) cmd_status "$@" ;;
    down)   cmd_down "$@" ;;
    ""|-h|--help|help) usage ;;
    *) log "unknown subcommand: ${sub}"; usage ;;
  esac
}

main "$@"
