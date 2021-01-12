# JLupin setup

Before proceeding to the next step, please wait until the setup scripts finish running.

Check if all microservices for both jlupin installations started completely:

## NODE_1
- Start NODE_1:
`/opt/jlupin/platform/start/start.sh`{{execute}}

- Check services status:
`/opt/jlupin/platform/start/control.sh microservice list`{{execute}}

- Check nginx status:
`/opt/jlupin/platform/start/control.sh microservice tech nginx status`{{execute}}

## NODE_2
- Start NODE_2:
`/opt/jlupin/platform2/start/start.sh`{{execute}}

- Check services status:
`/opt/jlupin/platform2/start/control.sh microservice list`{{execute}}

- Check nginx status:
`/opt/jlupin/platform2/start/control.sh microservice tech nginx status`{{execute}}
