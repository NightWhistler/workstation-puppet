#!/bin/sh

echo "Adding Puppet modules"
sudo /opt/puppetlabs/bin/puppet module install garethr/docker
sudo /opt/puppetlabs/bin/puppet module install bashtoni-timezone
sudo /opt/puppetlabs/bin/puppet module install zanloy-ohmyzsh
sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt
sudo /opt/puppetlabs/bin/puppet module install maestrodev-wget
sudo /opt/puppetlabs/bin/puppet module install spantree/java8
sudo /opt/puppetlabs/bin/puppet module install puppet-archive
sudo /opt/puppetlabs/bin/puppet module install talend-sbt
sudo /opt/puppetlabs/bin/puppet module install puppet-unattended_upgrades --force

echo "Setting up workstation... go grab some coffee :)"
./update.sh
