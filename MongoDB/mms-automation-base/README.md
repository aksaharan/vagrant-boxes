MongoDB MMS Automation Agent vagrant-box
======================================================

This vagrant file provides creation of vagrant boxes with MMS Automation agent configured
on it using the various settings provided in the Vagrantfile and the environment variable

# What happens as part of the Vagrant 
## MMS Automation Box creation 

# MMS Automation Agent Key
Following environment variables should be exported when the initial setup of the box is being 
done for MMS Automation. This will help setup the MMS automation agent.

export MMS_AUTOMATION_AGENT_KEY="<YourMMSAgentKey>"
export MMS_AUTOMATION_AGENT_GROUP_ID="<YourMMSGroupIDKey>"

## Package Installations

