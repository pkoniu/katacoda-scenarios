#!/bin/bash

# echo "Changing ulimits"
sed -i -e '$aroot            soft    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot            hard    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot            soft    nproc           32768' /etc/security/limits.conf
sed -i -e '$aroot            hard    nproc           32768' /etc/security/limits.conf
# sysctl -p /etc/security/limits.conf
sed -i -e 'session required pam_limits.so' /etc/pam.d/common-session
sed -i -e 'session required pam_limits.so' /etc/pam.d/common-session-noninteractive
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

mkdir -p /opt/jlupin/platform2
unzip jlupin.zip -d /opt/jlupin/platform2
mv /opt/jlupin/platform2/platform/* /opt/jlupin/platform2
rm -rf /opt/jlupin/platform2/platform
chmod 750 /opt/jlupin/platform2/start/start.sh
chmod 750 /opt/jlupin/platform2/start/control.sh
# echo 'user root root;' | cat - /opt/jlupin/platform2/start/configuration/edge.conf | tee /opt/jlupin/platform2/start/configuration/edge.conf
sed -i '1iuser root root;' /opt/jlupin/platform2/start/configuration/edge.conf
sed -i '/ssl/ s/^#*/#/g' /opt/jlupin/platform2/technical/nginx/linux/conf/servers/admin.conf

sed -i 's/DEBUG_PORT=12998/DEBUG_PORT=13998/' /opt/jlupin/platform2/start/configuration/setenv
sed -i 's/JMX_PORT=9010/JMX_PORT=19010/' /opt/jlupin/platform2/start/configuration/setenv

sed -i 's/  name: NODE_1/  name: NODE_2/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 9090/    port: 19090/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 8082/    port: 18082/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 9095/    port: 19095/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 9096/    port: 19096/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 9097/    port: 19097/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    port: 9098/    port: 19098/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/      begin: 20001/      begin: 40001/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/      end: 30000/      end: 50000/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/      begin: 30001/      begin: 50001/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/      end: 40000/      end: 60000/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/  NODE_1:/  NODE_2:/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    jlrmcPort: 9090/    jlrmcPort: 19090/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    queuePort: 9095/    queuePort: 19095/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    transmissionPort: 9096/    transmissionPort: 19096/' /opt/jlupin/platform2/start/configuration/main.yml
sed -i 's/    informationPort: 9097/    informationPort: 19097/' /opt/jlupin/platform2/start/configuration/main.yml

sed -i 's/    discoveryPort = "9098"/    discoveryPort = "19098"/' /opt/jlupin/platform2/start/configuration/edge.conf
sed -i 's/    discoveryPeersDefaultAdminPort = "8889"/    discoveryPeersDefaultAdminPort = "18889"/' /opt/jlupin/platform2/start/configuration/edge.conf
sed -i 's/    listen  8888;/    listen 18888;/' /opt/jlupin/platform2/start/configuration/edge.conf
sed -i 's/    listen  8889;/    listen 18889;/' /opt/jlupin/platform2/start/configuration/edge.conf

sed -i 's/  listen  8000;/  listen 18000;/' /opt/jlupin/platform2/start/configuration/edge_servers/edge8000.conf
sed -i 's/  server_name edge8000;/  server_name edge18000;/' /opt/jlupin/platform2/start/configuration/edge_servers/edge8000.conf

sed -i 's/  listen  8001;/  listen 18001;/' /opt/jlupin/platform2/start/configuration/edge_servers/edge8001.conf
sed -i 's/  server_name edge8001;/  server_name edge18001;/' /opt/jlupin/platform2/start/configuration/edge_servers/edge8001.conf

sed -i 's/  transmissionPort:  9096/  transmissionPort: 19096/' /opt/jlupin/platform2/start/control/configuration/control.yml
sed -i 's/  transmissionPort:  9096/  transmissionPort: 19096/' /opt/jlupin/platform2/application/webcontrol/control.yml

sed -i "s/  externalPort: '8000'/  externalPort: '18000'/" /opt/jlupin/platform2/application/exchange/servlet_configuration.yml
sed -i "s/  externalPort: '8888'/  externalPort: '18888'/" /opt/jlupin/platform2/application/webcontrol/servlet_configuration.yml

echo "done" >> /opt/.jlupin2-done

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
