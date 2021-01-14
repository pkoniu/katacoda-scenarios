# Enabling communication between the nodes

## Enabling the communication

`sed -i 's/discoveryPeersDefaultAdminPort = "8889"/discoveryPeersDefaultAdminPort = "18889"/' /opt/jlupin/platform1/start/configuration/edge.conf`{{execute}}

`/opt/jlupin/platform1/start/control.sh microservice tech nginx reload`{{execute}}

`/opt/jlupin/platform1/start/control.sh node peer add NODE_2 localhost 19090 19095 19096 19097`{{execute}}

## Checking if nodes see each other

`/opt/jlupin/platform1/start/control.sh node peers`{{execute}}

## Testing the application

[exchange app - deployed on NODE_1](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/)
