#! /bin/bash

set -e
set -x

echo "Installing MongoDB Shell Utilities"
sudo yum -y install http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/RPMS/mongodb-org-shell-2.6.2-1.x86_64.rpm

echo "Installing MMS Automation Agent"
sudo yum -y install https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager-latest.x86_64.rpm

echo "Updating the MMS Automation Agent configuration file"
sudo cp /etc/mongodb-mms/automation-agent.config /etc/mongodb-mms/automation-agent.config.orig

sudo sed -i -e "s/@API_KEY@/$MMSAUTO_AGENT_KEY/" /etc/mongodb-mms/automation-agent.config
sudo sed -i -e "s/@GROUP_ID@/$MMSAUTO_AGENT_GROUP_ID/" /etc/mongodb-mms/automation-agent.config

echo "Starting the MMS Automation Agent"
sudo service mongodb-mms-automation-agent start
