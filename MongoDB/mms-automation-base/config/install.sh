#! /bin/bash

set -e
set -x

echo "Installing MongoDB Shell Utilities"
sudo yum -y install http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/RPMS/mongodb-org-shell-2.6.2-1.x86_64.rpm

echo "Installing MMS Automation Agent"
sudo yum -y install https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager-latest.x86_64.rpm

echo "Updating the MMS Automation Agent configuration file"
