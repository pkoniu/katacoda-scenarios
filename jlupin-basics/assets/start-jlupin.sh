#!/bin/bash

echo "Starting JLupin platform..."

/opt/jlupin/platform/start/start.sh

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
