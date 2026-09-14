#!/bin/sh
# Deploy from this machine. Uses FLY_API_TOKEN from .env if present.
set -e
cd "$(dirname "$0")"
[ -f .env ] && export $(grep -E '^FLY_API_TOKEN=' .env | xargs) 2>/dev/null
exec ~/.fly/bin/flyctl deploy --remote-only --ha=false "$@"
