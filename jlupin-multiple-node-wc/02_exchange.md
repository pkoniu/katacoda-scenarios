# Example microservice architecture - Exchange

If the scripts in the previous step finished successfully, you should be able to see the application by opening the following link in the new browser tab: [exchange app - deployed on NODE_1](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/) or [exchange app - deployed on NODE_1](https://[[HOST_SUBDOMAIN]]-18000-[[KATACODA_HOST]].environments.katacoda.com/exchange/). You should also be able to see the application in the tab "Exchange", next to the terminal.

## CLI - basic commands

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