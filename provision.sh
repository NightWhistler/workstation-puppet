#!/bin/sh

echo "Adding Puppet modules"
sudo /opt/puppetlabs/bin/puppet module install garethr/docker
sudo /opt/puppetlabs/bin/puppet module install bashtoni-timezone
sudo /opt/puppetlabs/bin/puppet module install zanloy-ohmyzsh
sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt
sudo /opt/puppetlabs/bin/puppet module install maestrodev-wget
sudo /opt/puppetlabs/bin/puppet module install spantree/java8

echo "Setting up workstation... go grab some coffee :)"
sudo /opt/puppetlabs/bin/puppet apply --hiera_config hiera.yaml --modulepath /etc/puppetlabs/code/environments/production/modules:./modules: manifests 