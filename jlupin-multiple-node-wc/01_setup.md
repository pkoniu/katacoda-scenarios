# JLupin setup

Before proceeding to the next step, please wait until the setup scripts finish running.

Check if all microservices for both jlupin installations started completely:

## NODE_1
- Services:
`/opt/jlupin/platform/start/control.sh microservice list`{{execute}}

- Nginx:
`/opt/jlupin/platform/start/control.sh microservice tech nginx status`{{execute}}

## NODE_2
- Services:
`/opt/jlupin/platform2/start/control.sh microservice list`{{execute}}

- Nginx:
`/opt/jlupin/platform2/start/control.sh microservice tech nginx status`{{execute}}
