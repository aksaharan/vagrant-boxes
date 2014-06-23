#### Number of vagrant boxes to create
INSTANCES = 1

#### Hostname specific information 
HOSTNAME_PREFIX = "mms-automation-"
HOSTNAME_SUFFIX = ".vbox.vagrant"

USE_DHCP = false

#### Following IP related setting is useful only if USE_DHCP = false
IP_ADDRESS_PREFIX = "192.168.20."
IP_SUFFIX_START = 2

#### MMS Automation Agent Specific Keys
MMS_AUTOMATION_AGENT_KEY = ENV["MMS_AUTOMATION_AGENT_KEY"]
MMS_AUTOMATION_AGENT_GROUP_ID = ENV["MMS_AUTOMATION_AGENT_GROUP_ID"]
