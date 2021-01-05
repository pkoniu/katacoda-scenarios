# Own microservice example - packaging, deployment, testing

## Required dependencies

Install maven:
`apt update`{{execute}}
`apt install maven`{{execute}}

Verify maven installation and `$JAVA_HOME` environment variable:
`mvn -version`{{execute}}
`echo $JAVA_HOME`{{execute}}
`which java`{{execute}}

## Packaging

In order to deploy an application to jlupin we need to create a fat jar, containing all required libraries. To achieve this, run following command:
`mvn package`{{execute}}

## Manual deploy

After successful compilation and packaging, copy the jar file to `platform/application/hello-jlupin-scala`:
`cp target/hello-jlupin-scala-app-1.0.jar /opt/jlupin/platform/application/hello-jlupin-scala`{{execute}}

## Application start

Now either run control command or start it in interactive mode:
`/opt/jlupin/platform/start/control.sh microservice start hello-jlupin-scala`{{execute}}

## Test the application
`curl -X POST http://localhost:8082/hello-jlupin-scala/exampleService/hello -H 'Content-Type: application/json' -H 'X-JLNS-API-ID: ROA' -d '"Katacoda"'`{{execute}}
