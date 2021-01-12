#!/bin/bash

node_number=$1

echo "Starting JLupin platform for node $node_number..."

/opt/jlupin/platform${node_number}/start/start.sh

status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)

check-jlupin-status.sh &
pid=$!

echo "Waiting for initialization..."
spin='-\|/'
i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done

echo "JLupin platform started successfully."
