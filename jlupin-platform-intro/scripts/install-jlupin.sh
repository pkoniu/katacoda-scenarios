#!/bin/bash

echo "Installing system dependencies"
apt update
apt install -y curl unzip

echo "Downloading jlupin@1.6.1"
curl https://jlupin.io/jlsa/download?id=50_645 -o jlupin.zip

echo "Preparing JLupin"
mkdir -p /opt/jlupin
unzip jlupin.zip -d /opt/jlupin
chmod 750 /opt/jlupin/platform/start/start.sh
chmod 750 /opt/jlupin/platform/start/control.sh
echo 'user root root;' | cat - /opt/jlupin/platform/start/configuration/edge.conf | tee /opt/jlupin/platform/start/configuration/edge.conf
cd /opt/jlupin/platform/application
for f in $(find . -name configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx64M/g' $f; done
for f in $(find . -name configuration.yml); do sed -i 's/Xms[0-9]*M/Xms64M/g' $f; done
for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xmx[0-9]*M/Xmx100M/g' $f; done
for f in $(find . -name servlet_configuration.yml); do sed -i 's/Xms[0-9]*M/Xms100M/g' $f; done
sed -i 's/Xmx[0-9]*M/Xmx64M/g' /opt/jlupin/platform/start/configuration/setenv
sed -i 's/Xms[0-9]*M/Xms64M/g' /opt/jlupin/platform/start/configuration/setenv
sed -i 's/Xms[0-9]*M/Xms192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml
sed -i 's/Xmx[0-9]*M/Xmx192M/g' /opt/jlupin/platform/application/webcontrol/servlet_configuration.yml

cd /opt/jlupin/platform
sed -i '/ssl/ s/^#*/#/g' technical/nginx/linux/conf/servers/admin.conf

echo "Starting JLupin"
/opt/jlupin/platform/start/start.sh
