#!/bin/bash

set -ex

HOSTS_FILE="/etc/hosts"

# Setup the localhost setup first
echo "Setting up locahost specific entries in the $HOSTS_FILE"
> $HOSTS_FILE
echo "This file is generated as part of the Vagrant startup"
echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" >> $HOSTS_FILE
echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> $HOSTS_FILE

fqdn=$(hostname)
dn=$(hostname| sed 's/^\([^\.]*\).*/\1/g')

echo "127.0.0.1	$fqdn $dn" >> $HOSTS_FILE
echo "::1	$fqdn $dn" >> $HOSTS_FILE

# Setup all the hostnames that are specific to this host first
echo "Setting up hostnames for the configured IP address"
for ipAddress in $(ifconfig | grep -w inet | grep -v "127\.0\." | sed -e 's/.*inet//g' -e 's/ *[^1-9]*\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\).*/\1.\2.\3.\4/g')
do 
	ipHostname=$(echo "$ipAddress" | sed -e 's/\./-/' -e 's/^\(.*\)/ip-\1/g')
	if [ -n "$fqdn" -o -n "$ipHostname" ]; then
		hostnameAddress="$ipAddress     $dn $fqdn $ipHostname"
		echo "Adding hostname entry: $hostnameAddress"
		sudo sh -c "echo \"$hostnameAddress\" >> $HOSTS_FILE"
	fi
done

# Setup all the hostnames that are specific to other hosts in this cluster
echo "Setting up hostnames for the all the configured hostnames in this cluster instance"
echo -e "\n\n#These entries are for all the hostnames in this vagrant instance\n$MMSAUTO_ADDRESS_MAP" | tr ';|:' '\n \t' >> $HOSTS_FILE
