#! /bin/bash

set -ex

# Assumes the RPM file to be available in the /vagrant mounter shared directory. If not, uses the online URL
function installRPM {
	RPMFILE="/vagrant/$1"
	if [ -f "$RPMFILE" -a -r "$RPMFILE" ]; then
		sudo yum --assumeyes --cacheonly install "$RPMFILE"
	elif [ -n "$2" ]; then
		echo "Local RPM file not found, will try to install from internet location"
		sudo yum --assumeyes --cacheonly install "$2"
	else
		echo "Failed to install the RPM for following options [RPMFile: $RPMFILE, URL: $2]"
	fi
}


echo "Installing MongoDB Shell Utilities"
installRPM "mongodb-org-shell-2.6.2-1.x86_64.rpm" "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/RPMS/mongodb-org-shell-2.6.2-1.x86_64.rpm"

echo "Installing MMS Automation Agent"
installRPM "mongodb-mms-automation-agent-manager-latest.x86_64.rpm" "https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager-latest.x86_64.rpm"

echo "Updating the MMS Automation Agent configuration file"
sudo cp /etc/mongodb-mms/automation-agent.config /etc/mongodb-mms/automation-agent.config.orig

sudo sed -i -e "s/@API_KEY@/$MMSAUTO_AGENT_KEY/" /etc/mongodb-mms/automation-agent.config
sudo sed -i -e "s/@GROUP_ID@/$MMSAUTO_AGENT_GROUP_ID/" /etc/mongodb-mms/automation-agent.config

echo "Starting the MMS Automation Agent"
sudo service mongodb-mms-automation-agent start

echo "Creating data directory /data/db with mongod ownership"
sudo mkdir -p /data/db
sudo chown mongod:mongod /data/db

ls -ld /data/db
ls -ltr /data/db

echo "following iptables filters created by default on Linux are being cleared now"
sudo iptables -L
sudo iptables -F

echo "following iptables filters after clearing it up"
sudo iptables -L
