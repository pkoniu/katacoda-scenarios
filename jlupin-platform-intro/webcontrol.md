

`cd /opt/jlupin/platform/application`{{execute}}
`for f in $(find . -name configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx64M/g' $f; done`{{execute}}
`for f in $(find . -name configuration.yml); do sed -i 's/Xms[0-9]*M/Xms64M/g' $f; done`{{execute}}
`for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx100M/g' $f; done`{{execute}}
`for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xms[0-9]*M/Xms100M/g' $f; done`{{execute}}
`sed -i 's/Xmx[0-9]*M/Xmx64M/g' /opt/jlupin/platform/start/configuration/setenv`{{execute}}
`sed -i 's/Xms[0-9]*M/Xms64M/g' /opt/jlupin/platform/start/configuration/setenv`{{execute}}
`sed -i 's/Xms[0-9]*M/Xms192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml`{{execute}}
`sed -i 's/Xmx[0-9]*M/Xmx192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml`{{execute}}

<!-- https://jlupin.io/jlsa/download?id=54_622 -->

[select_port](https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/)
[webcontrol](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/webcontrol/)