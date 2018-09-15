#!/bin/sh

echo "Adding Puppet modules"
#FIXME: We need to mode to puppet-wget, but for now some modules
#still depend on the older wget

#sudo /opt/puppetlabs/bin/puppet module install puppet-wget
sudo /opt/puppetlabs/bin/puppet module install talend-sbt
sudo /opt/puppetlabs/bin/puppet module install puppet-unattended_upgrades 

sudo /opt/puppetlabs/bin/puppet module install puppetlabs/docker
sudo /opt/puppetlabs/bin/puppet module install bashtoni-timezone
sudo /opt/puppetlabs/bin/puppet module install zanloy-ohmyzsh
#sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt
sudo /opt/puppetlabs/bin/puppet module install spantree/java8
sudo /opt/puppetlabs/bin/puppet module install puppet-archive

echo "Setting up workstation... go grab some coffee :)"
./update.sh
