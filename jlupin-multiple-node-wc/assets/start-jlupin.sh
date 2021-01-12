#!/bin/bash

node_number=$1

if [ $node_number == '1' ]; then
  port=8000
else
  port=18000
fi

echo "Starting JLupin platform for node $node_number..."

/opt/jlupin/platform${node_number}/start/start.sh

check-jlupin-status.sh $port &
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
