#!/bin/bash

# echo "Changing ulimits"
sed -i -e '$aroot             soft    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot             hard    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot             soft    nproc           32768' /etc/security/limits.conf
sed -i -e '$aroot             hard    nproc           64500' /etc/security/limits.conf
sysctl -p
echo "done" >> /opt/.sys-setup

# echo "Installing system dependencies"
apt update
apt install -y curl unzip htop
echo "done" >> /opt/.sys-dep-install

# echo "Downloading jlupin@1.6.1"
# curl https://jlupin.io/jlsa/download?id=50_645 -o jlupin.zip
curl https://kacdab-download.s3.eu-central-1.amazonaws.com/jlupin_platform_version_1_6_1_latest.zip -o jlupin.zip
echo "done" >> /opt/.jlupin-download

# echo "Preparing JLupin"
mkdir -p /opt/jlupin

unzip jlupin.zip -d /opt/jlupin
chmod 750 /opt/jlupin/platform/start/start.sh
chmod 750 /opt/jlupin/platform/start/control.sh
# echo 'user root root;' | cat - /opt/jlupin/platform/start/configuration/edge.conf | tee /opt/jlupin/platform/start/configuration/edge.conf
sed -i '1iuser root root;' /opt/jlupin/platform/start/configuration/edge.conf
sed -i '/ssl/ s/^#*/#/g' /opt/jlupin/platform/technical/nginx/linux/conf/servers/admin.conf

echo "done" >> /opt/.jlupin1-done

# echo "Starting JLupin"
# /opt/jlupin/platform/start/start.sh
# sleep 30
# echo "done" >> /opt/.jlupin1-start

# /opt/jlupin/platform2/start/start.sh
# sleep 30
# echo "done" >> /opt/.jlupin2-start

# Stopping exchange-related microservices
# /opt/jlupin/platform/start/control.sh microservice stop
# /opt/jlupin/platform2/start/control.sh microservice stop

# NODE_1
# node peer add NODE_2 localhost 19090 19095 19096 19097

# NODE_2
# node peer add NODE_1 localhost

# Notifying finish
echo "done" >> /opt/.setup-finish
