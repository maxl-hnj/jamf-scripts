#!/bin/bash

# This script tries to get the DNS-Record of the current IP-Adress and set
# the system hostname in order to get the correct hostname in the AD-Binding
# process.

# Get current IP-Address and declare as variable
IP="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"

# Define prefix/suffix to remove from result 
PREFIX="*.*.*.*.in-addr.arpa domain name pointer "
SUFFIX=".maxiv.lu.se."

# Dns lookup of hostname from current IP-Address
HOST="$(host $IP)"

# Remove Prefix
HOST1=${HOST#$PREFIX}
# Remove Suffix
HOSTNAME=${HOST1%$SUFFIX}

# Set hostname
scutil --set LocalHostName $HOSTNAME
scutil --set ComputerName $HOSTNAME
scutil --set HostName $HOSTNAME

# Print the DNS hostname
# echo "Hostname set to:" $HOSTNAME

