# Own microservice example - packaging, deployment, testing

## Packaging

In order to deploy an application to jlupin we need to create a fat jar, containing all required libraries. To achieve this, run following command:
`mvn package`{{execute}}

## Manual deploy

After successful compilation and packaging, copy the jar file to `platform/application/hello-jlupin-scala`:

`cp`{{execute}}