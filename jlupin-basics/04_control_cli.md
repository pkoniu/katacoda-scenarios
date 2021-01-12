# CLI - basic commands

Starting the CLI in interactive mode:

`/opt/jlupin/platform/start/control.sh`{{execute}}

## Basic operations

- List all microservices deployed on the platform
`microservice list`

- Check more detailed status of a specific microservice, e.g.:
`microservice status exchange`

- Restart specific microservice, e.g.:
`microservice restart exchange`

- Stop specific microservice, e.g.:
`microservice stop exchange`

- Start specific microservice, e.g.:
`microservice start exchange`

- Stop all microservices:
`microservice stop *`

- Start all microservices:
`microservice start *`

- Quit the CLI
`quit`

- Checking status of the node:
`node status`

- Stopping the JLupin Platform (along with all running microservices):
`node shutdown`

- Force stop the JLuping Platform (along with all running microservices):
`node terminate`

## Passing the commands to CLI

`/opt/jlupin/platform/start/control.sh [command]`

For example:
`/opt/jlupin/platform/start/control.sh microservice status exchange`{{execute}}