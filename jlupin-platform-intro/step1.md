# JLupin Platform Tutorial

## JLupin installation

- Update the registry
`apt update`{{execute}}

- Install required dependencies
`apt install -y curl openjdk-14-jre-headless unzip`{{execute}}

- Create required directories
`mkdir -p /opt/jlupin`{{execute}}

- Download jlupin platform
`curl https://jlupin.io/jlsa/download?id=50_645 -o jlupin.zip`{{execute}}

- Unpack the downlaoded archive
`unzip jlupin.zip -d /opt/jlupin`{{execute}}

- Ensure the execution scripts have proper rights
`chmod 750 /opt/jlupin/platform/start/start.sh`{{execute}}
`chmod 750 /opt/jlupin/platform/start/control.sh`{{execute}}

- Enable nginx as root
`echo 'user root root;' | cat - /opt/jlupin/platform/start/configuration/edge.conf | tee /opt/jlupin/platform/start/configuration/edge.conf`{{execute}}

## Starting JLuping with example application

- Start the JLupin Platform
`/opt/jlupin/platform/start/start.sh`{{execute}}

- View the logs
`less /home/vagrant/jlupin/platform/logs/server/main/start/server.out`

After a couple of minutes, you should see the information in logs, that everything deployed correctly and is up and running.

## View the example application

Check that the app is running by opening the following link in another tab: [click!](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/)
