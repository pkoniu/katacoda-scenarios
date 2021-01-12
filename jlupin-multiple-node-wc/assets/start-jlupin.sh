#!/bin/bash

set -ex

echo "Starting JLupin platform..."

/opt/jlupin/platform/start/start.sh

echo "Waiting for intialization..."

status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)

while [[ "$status" != "200" ]]
do
  sleep 5
  status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)
done

echo "JLupin platform started successfully."