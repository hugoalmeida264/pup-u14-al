#!/bin/bash

# Change the timzone to GMT London
# Set the timezone to GMT Londin
sudo cp /usr/share/zoneinfo/Europe/London /etc/localtime

# configure uk deb mirrors
sed -i 's/us.archive/uk.archive/g' /etc/apt/sources.list

# update sources to install puppet and puppet modules 
sudo apt-get update
sudo apt-get install -y puppet-common puppet-module-puppetlabs-apt
sudo puppet module install -f garethr/docker # -f to reinstall in --provision switch is used
sudo puppet module install -f saz-sudo # -f to reinstall in --provision switch is used
