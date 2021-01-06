# JLupin Platform Tutorial

## JLupin installation

- Update the registry
`apt update`{{execute}}

- Install required dependencies
`apt install -y curl unzip`{{execute}}

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

`cd /opt/jlupin/platform/application`{{execute}}
`for f in $(find . -name configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx64M/g' $f; done`{{execute}}
`for f in $(find . -name configuration.yml); do sed -i 's/Xms[0-9]*M/Xms64M/g' $f; done`{{execute}}
`for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx100M/g' $f; done`{{execute}}
`for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xms[0-9]*M/Xms100M/g' $f; done`{{execute}}
`sed -i 's/Xmx[0-9]*M/Xmx64M/g' /opt/jlupin/platform/start/configuration/setenv`{{execute}}
`sed -i 's/Xms[0-9]*M/Xms64M/g' /opt/jlupin/platform/start/configuration/setenv`{{execute}}
`sed -i 's/Xms[0-9]*M/Xms192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml`{{execute}}
`sed -i 's/Xmx[0-9]*M/Xmx192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml`{{execute}}

`cd /opt/jlupin/platform`{{execute}}
`sed -i '/ssl/ s/^#*/#/g' technical/nginx/linux/conf/servers/admin.conf`{{execute}}

## Starting JLuping with example application

- Start the JLupin Platform
`/opt/jlupin/platform/start/start.sh`{{execute}}

- View the logs
`less /opt/jlupin/platform/logs/server/main/start/server.out`{{execute}}

After a couple of minutes, you should see the information in logs, that everything deployed correctly and is up and running.

## View the example application

Check that the app is running by opening the following link in another tab: [Exchange](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/)

Check that the app is running by opening the following link in another tab: [Webcontrol](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/webcontrol/)
