# Hello

## Installation

`sudo apt update`{{execute}}
`sudo apt install -y curl openjdk-14-jre-headless unzip`{{execute}}
`sudo mkdir -p /opt/jlupin`{{execute}}
`curl https://jlupin.io/jlsa/download?id=50_645 -o jlupin.zip`{{execute}}
`sudo unzip jlupin.zip -d /opt/jlupin`{{execute}}
`sudo chmod 750 /opt/jlupin/platform/start/start.sh`{{execute}}
`sudo chmod 750 /opt/jlupin/platform/start/control.sh`{{execute}}
`/opt/jlupin/platform/start/start.sh`{{execute}}
`curl localhost:8000/exchange`{{execute}}

## View
https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/