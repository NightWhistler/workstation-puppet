#!/bin/sh
cd ~ && wget https://apt.puppetlabs.com/puppet-release-xenial.deb
sudo dpkg -i puppet-release-xenial.deb
#sudo sh -c 'echo "deb http://apt.puppetlabs.com// bionic puppet5" >> /etc/apt/sources.list.d/puppet.list'

sudo apt-get update
sudo apt-get install puppet-agent


