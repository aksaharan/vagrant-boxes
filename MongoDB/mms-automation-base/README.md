MongoDB MMS Automation Agent vagrant-box
======================================================

This vagrant file provides creation of vagrant boxes with MMS Automation agent configured
on it using the various settings provided in the Vagrantfile and the environment variable

## MMS Automation Box creation 
Vagrant box setup behaviour is configured using the control paramaters available in the file
config/vagrant_config.virtualbox.rb. Following are some of the values that are available 
to be configured for the instances being created:

#### Number of vagrant boxes to create
```
INSTANCES = 1
```

#### Hostname specific information 
```
HOSTNAME_PREFIX = "mms-automation-"
HOSTNAME_SUFFIX = ".vbox.vagrant"
```

##### Following are IP assignment related settings
```
USE_DHCP = false
```

##### Following IP related setting is useful only if USE_DHCP = false
```
IP_ADDRESS_PREFIX = "192.168.20."
IP_SUFFIX_START = 2
```

#### MMS Automation Agent Specific Keys
MMS Automation Agent API Key / Group ID can be se in following two ways before deploying the vagrant boxes
- By exporting following environment variables when the initial setup of the box is being 
done for MMS Automation.
```
export MMS_AUTOMATION_AGENT_KEY="<YourMMSAgentKey>"
export MMS_AUTOMATION_AGENT_GROUP_ID="<YourMMSGroupIDKey>"
```
- By directly updating following entries in the config/vagrant_config.virtualbox.rb
```
MMS_AUTOMATION_AGENT_KEY = "<YourMMSAgentKey>"
MMS_AUTOMATION_AGENT_GROUP_ID = "<YourMMSGroupID>"
```

#### MongoDB Package version information
As part of the machine setup, mongodb-shell package is also installed. This is driven by the version
number specified for the following variable in the file:
```
MONGODB_SHELL_VERSION = "2.6.2-1"
```

## Package Installations
Following packages are installed as part of the box setup - install process
- MongoDB Shell
- MMS Automation Agent
