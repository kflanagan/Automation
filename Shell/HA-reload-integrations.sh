#!/usr/bin/env bash
set -euo pipefail

# Interactive script to call Home Assistant's reload_all service
# Prompts for Home Assistant URL and a long-lived access token (hidden input)

#read -rp "Home Assistant URL (default http://localhost:8123): " HA_URL
HA_URL=${HA_URL:-http://192.168.1.206:8123/}
HA_TOKEN=${HA_TOKEN:-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJlZDFlNmQyMTBkZjE0YWVhYmI5MDExNTFiNjYwNDE0NSIsImlhdCI6MTc4ODM5ODc0MCwiZXhwIjoyMTAzNzU4NzQwfQ.HFbD7WHp6Uuz3hSTxOHeOFrY2mv9ZQyAl8sxSAoC0xM}
#read -rsp "Long-Lived Access Token: " HA_TOKEN
#echo

read -rp "Send reload_all to ${HA_URL} ? [y/N]: " CONFIRM
if [[ ! $CONFIRM =~ ^[Yy] ]]; then
	echo "Aborted by user."
	exit 1
fi

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
	-H "Authorization: Bearer ${HA_TOKEN}" \
	-H "Content-Type: application/json" \
	"${HA_URL%/}/api/services/homeassistant/reload_all")

if [[ ${HTTP_CODE} =~ ^2 ]]; then
	echo "Reload triggered successfully (HTTP ${HTTP_CODE})."
	exit 0
else
	echo "Request failed with HTTP ${HTTP_CODE}."
	exit 2
fi
#eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJlZDFlNmQyMTBkZjE0YWVhYmI5MDExNTFiNjYwNDE0NSIsImlhdCI6MTc4ODM5ODc0MCwiZXhwIjoyMTAzNzU4NzQwfQ.HFbD7WHp6Uuz3hSTxOHeOFrY2mv9ZQyAl8sxSAoC0xM

#https://6pnxaz1zfghw3x47xtbfpvisat9ksq8e.ui.nabu.casa