#!/usr/bin/env bash
set -euo pipefail

url="${OSAC_UI_URL:-http://ui.osac.localhost:8080}"
status="$(curl --fail --silent --show-error --output /dev/null --write-out '%{http_code}' "$url")"

if [[ "$status" != "200" ]]; then
  echo "OSAC UI Gateway returned HTTP ${status}, expected 200" >&2
  exit 1
fi

echo "OSAC UI Gateway is reachable at ${url}"
