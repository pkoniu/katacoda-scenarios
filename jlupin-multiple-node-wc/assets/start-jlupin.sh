#!/bin/bash

node_number=$1

echo "Starting JLupin platform for node $node_number..."

/opt/jlupin/platform${node_number}/start/start.sh

echo "Waiting for intialization..."

status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)

check-jlupin-status.sh &

pid=$!

spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

echo -n "[initializing] ${spin[0]}"
while [ kill -0 $pid ]
do
  for i in "${spin[@]}"
  do
        echo -ne "\b$i"
        sleep 0.1
  done
done

echo "JLupin platform started successfully."
