#!/bin/sh

# Zastępuje adres IP w szablonie
sed -i "s/{HOST_IP_ADDRESS}/${HOST_IP_ADDRESS}/g" /etc/bind/db.local

# Uruchamia serwer BIND w tle
named -g
