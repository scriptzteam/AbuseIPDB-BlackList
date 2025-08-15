#!/usr/bin/env bash

API_KEY="${{ secrets.ABUSEIPDB_API_KEY }}"
CONFIDENCE_MIN=100
LIMIT=10000
OUTPUT_FILE="abuseipdb_blacklist.txt"

curl -sG "https://api.abuseipdb.com/api/v2/blacklist" \
  --data-urlencode "confidenceMinimum=$CONFIDENCE_MIN" \
  --data-urlencode "limit=$LIMIT" \
  -H "Key: $API_KEY" \
  -H "Accept: text/plain" | sort -n > "$OUTPUT_FILE"
