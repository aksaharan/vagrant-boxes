#!/bin/bash

set -ex

echo "Setting up hostnames for the configured IP address"
for ipAddress in $(ifconfig | grep -w inet | grep -v "127\.0\." | sed -e 's/.*inet//g' -e 's/ *[^1-9]*\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\).*/\1.\2.\3.\4/g')
do 
	ipHostname=$(echo "$ipAddress" | sed -e 's/\./-/' -e 's/^\(.*\)/ip-\1/g')
	fqdn=$(hostname -f)
	if [ -n "$fqdn" -o -n "$ipHostname" ]; then
		hostnameAddress="$ipAddress     $fqdn $ipHostname"
		echo "Adding hostname entry: $hostnameAddress"
		sudo sh -c "echo \"$hostnameAddress\" >> /etc/hosts"
	fi
done

