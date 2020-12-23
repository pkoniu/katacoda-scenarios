# CLI - Controlling deployed microservices

## Using the CLI

You can either start the CLI in interactive mode or pass specific commands to the script. Both methods are described below.

## Starting the CLI in interactive mode

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

## Passing the commands to CLI

`/opt/jlupin/platform/start/control.sh [command]`

For example:
`/opt/jlupin/platform/start/control.sh microservice status exchange`{{execute}}
