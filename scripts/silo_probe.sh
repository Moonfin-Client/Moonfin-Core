#!/usr/bin/env bash
# Probe a Silo server (and optionally Emby) and save raw JSON responses for
# comparing against packages/server_silo/test/fixtures/ after a server upgrade.
#
# Usage:
#   SILO_URL=https://silo.example.com \
#   SILO_TOKEN=<access token or personal API key> \
#   SILO_PROFILE_ID=<profile id> \
#   EMBY_URL=https://emby.example.com EMBY_TOKEN=<api key> \
#   scripts/silo_probe.sh [movie_content_id] [episode_content_id]
#
# Without SILO_TOKEN only the public endpoints run. Output goes to
# build/silo-probe/<timestamp>/ (build/ is gitignored). Responses contain signed
# URLs and file paths: scrub them before copying anything into fixtures.
set -euo pipefail

: "${SILO_URL:?set SILO_URL}"
MOVIE="${1:-movie-imdb-tt0295701}"
EPISODE="${2:-episode-tvdb-192061-1-1}"
OUT="build/silo-probe/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$OUT/silo" "$OUT/emby"

silo() { # silo <name> <path>
  local hdr=()
  if [[ -n "${SILO_TOKEN:-}" ]]; then hdr+=(-H "Authorization: Bearer $SILO_TOKEN"); fi
  if [[ -n "${SILO_PROFILE_ID:-}" ]]; then hdr+=(-H "X-Profile-Id: $SILO_PROFILE_ID"); fi
  local code
  code=$(curl -sS -m 30 "${hdr[@]}" -H "X-Silo-Client: moonfin-probe" \
    -o "$OUT/silo/$1.json" -w '%{http_code}' "$SILO_URL/api/v2$2")
  printf '%-34s %s  %s\n' "$1" "$code" "$2"
}

echo "== Silo public"
silo system_info        /system/info
silo system_identity    /system/identity
silo system_setup       /system/setup
silo theme_branding     /theme/branding

if command -v python3 >/dev/null; then
  python3 - "$OUT/silo/system_info.json" <<'PY'
import json, sys
info = json.load(open(sys.argv[1]))
print(f"   server_version={info.get('server_version')} api_major={info.get('api_major')}")
print(f"   contract_digest={info.get('contract_digest')}")
PY
fi

if [[ -n "${SILO_TOKEN:-}" ]]; then
  echo "== Silo authenticated"
  silo account_me             /account/me
  silo profiles               /profiles
  silo user_libraries         /user/libraries
  silo home_layout            /home/layout
  silo playback_capabilities  /playback/capabilities
  silo images_capabilities    /images/capabilities
  silo events_capabilities    /events/capabilities
  silo search_capabilities    /catalog/search/capabilities
  silo catalog_page1          "/catalog?limit=5"
  silo catalog_item_movie     "/catalog/items/$MOVIE"
  silo catalog_versions_movie "/catalog/items/$MOVIE/versions"
  silo watch_movie            "/watch/$MOVIE"
  silo markers_movie          "/markers/items/$MOVIE"
  silo watch_episode          "/watch/$EPISODE"
  silo markers_episode        "/markers/items/$EPISODE"
fi

if [[ -n "${EMBY_URL:-}" ]]; then
  echo "== Emby"
  code=$(curl -sS -m 30 -o "$OUT/emby/system_info_public.json" -w '%{http_code}' \
    "$EMBY_URL/System/Info/Public")
  printf '%-34s %s\n' system_info_public "$code"
  if [[ -n "${EMBY_TOKEN:-}" ]]; then
    code=$(curl -sS -m 30 -H "X-Emby-Token: $EMBY_TOKEN" -o "$OUT/emby/system_info.json" \
      -w '%{http_code}' "$EMBY_URL/System/Info")
    printf '%-34s %s\n' system_info "$code"
  fi
fi

echo "Saved to $OUT"
