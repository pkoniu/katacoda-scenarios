#!/bin/bash

# echo "Changing ulimits"
sed -i -e '$aroot            soft    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot            hard    nofile          64500' /etc/security/limits.conf
sed -i -e '$aroot            soft    nproc           32768' /etc/security/limits.conf
sed -i -e '$aroot            hard    nproc           32768' /etc/security/limits.conf
sysctl -p /etc/security/limits.conf

sed -i 's/#DefaultLimitNOFILE=/DefaultLimitNOFILE=64500/' /etc/systemd/system.conf
sed -i 's/#DefaultLimitNPROC=/DefaultLimitNPROC=32768/' /etc/systemd/system.conf

sed -i -e 'session required pam_limits.so' /etc/pam.d/common-session
sed -i -e 'session required pam_limits.so' /etc/pam.d/common-session-noninteractive
ulimit -n 64500
ulimit -u 32768

echo "done" >> /opt/.sys-setup

# echo "Installing system dependencies"
apt update && apt install -y curl unzip htop
echo "done" >> /opt/.sys-deps-installed

# echo "Downloading jlupin@1.6.1"
curl https://kacdab-download.s3.eu-central-1.amazonaws.com/platform_webcontrol_upgrade_2.zip -o jlupin.zip
echo "done" >> /opt/.jlupin-downloaded

# echo "Preparing JLupin"
mkdir -p /opt/jlupin
unzip jlupin.zip -d /opt/jlupin
chmod 750 /opt/jlupin/platform/start/start.sh
chmod 750 /opt/jlupin/platform/start/control.sh
sed -i '1iuser root root;' /opt/jlupin/platform/start/configuration/edge.conf
sed -i '/ssl/ s/^#*/#/g' /opt/jlupin/platform/technical/nginx/linux/conf/servers/admin.conf
sed -i 's/  isStartOnMainServerInitialize: true/  isStartOnMainServerInitialize: false/' /opt/jlupin/platform/application/currency-converter-eur/configuration.yml

echo "done" >> /opt/.jlupin-setup

# echo "Starting JLupin platform"
/opt/jlupin/platform/start/start.sh
echo "done" >> /opt/.jlupin-started

status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)

while [[ "$status" != "200" ]]
do
  sleep 5
  status=$(curl -w "%{http_code}\\n" -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Connection: keep-alive' --data-raw $'{\n  "value": "12",\n  "currency": "USD"\n}' http://localhost:8000/exchange/convert -s -o /dev/null)
done

# echo "Finished"
echo "done" >> /opt/.exchange-available
