#!/bin/bash

#####
## this script steps you through setting up your inventory file
## all local 

read -p "do you have any NTP servers? [y/n] "
echo "$REPLY" | grep -i "^y"  ## look for any sort of 'yes'

if [ $? -eq 0 ] ; then
    echo "Enter one or more NTP servers, IP or hostname, space delimited"
    read -p "> " -a NTP_SERVERS
else
    echo "using internet servers..."
fi

echo "Enter one or more clients, space delimited"
read -p "> " -a NTP_CLIENTS

if [ ! "$NTP_CLIENTS" ] ; then
    echo "need to enter at least one client"
    exit 1
fi

[ 0 ] && echo $NTP_SERVERS

cat > inventory.yml <<EOF
---
all:
  hosts:
EOF

{ 
    for NTP_CLIENT in ${NTP_CLIENTS[*]} ; do
        echo "    $NTP_CLIENT:"
    done

    ## only add vars: if we have NTP servers to point to
    if [ "$NTP_SERVERS" ] ; then
        echo "  vars:"
        echo "    ntp_servers:"
	for NTP_SERVER in ${NTP_SERVERS[*]} ; do
            echo "      - $NTP_SERVER"
        done
    fi
} >> inventory.yml 


echo "run:"
echo " ansible-playbook -i inventory.yml main.yml"
