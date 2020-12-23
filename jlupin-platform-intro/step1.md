# Hello

## Installation

`apt update`{{execute}}
`apt install -y curl openjdk-14-jre-headless unzip`{{execute}}
`mkdir -p /opt/jlupin`{{execute}}
`curl https://jlupin.io/jlsa/download?id=50_645 -o jlupin.zip`{{execute}}
`unzip jlupin.zip -d /opt/jlupin`{{execute}}
`chmod 750 /opt/jlupin/platform/start/start.sh`{{execute}}
`chmod 750 /opt/jlupin/platform/start/control.sh`{{execute}}
`echo 'user root root;' | cat - /opt/jlupin/platform/start/configuration/edge.conf | tee /opt/jlupin/platform/start/configuration/edge.conf`{{execute}}
`/opt/jlupin/platform/start/start.sh`{{execute}}

## View
https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/