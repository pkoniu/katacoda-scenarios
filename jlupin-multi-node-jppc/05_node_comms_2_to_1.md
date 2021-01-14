# Enabling communication between the nodes

## Enabling the communication

`/opt/jlupin/platform2/start/control.sh node peer add NODE_1 localhost`{{execute}}

## Checking if nodes see each other

`/opt/jlupin/platform2/start/control.sh node peers`{{execute}}

## Testing the application

[exchange app - deployed on NODE_1](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/)
