#!/bin/bash
cd /usr/src
wget http://repo.zabbix.com/zabbix/3.0/debian/pool/main/z/zabbix-release/zabbix-release_3.0-1+jessie_all.deb
dpkg -i zabbix-release_3.0-1+jessie_all.deb
apt-get update
apt-get install zabbix-agent
