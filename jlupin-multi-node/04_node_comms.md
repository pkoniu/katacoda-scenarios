# Enabling communication between the nodes

## Enabling the communication

### NODE_1

`sed -i 's/discoveryPeersDefaultAdminPort = "8889"/discoveryPeersDefaultAdminPort = "18889"/' /opt/jlupin/platform/start/configuration/edge.conf`{{execute}}

`/opt/jlupin/platform/start/control.sh microservice tech nginx reload`{{execute}}

`/opt/jlupin/platform/start/control.sh node peer add NODE_2 localhost 19090 19095 19096 19097`{{execute}}

### NODE_2

`/opt/jlupin/platform2/start/control.sh node peer add NODE_1 localhost`{{execute}}

## Checking if nodes see each other

### NODE_1
`/opt/jlupin/platform/start/control.sh node peers`{{execute}}

### NODE_2
`/opt/jlupin/platform2/start/control.sh node peers`{{execute}}
