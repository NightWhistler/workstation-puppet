#!/bin/sh

#sudo sh -c 'echo "deb http://apt.puppetlabs.com// bionic puppet5" >> /etc/apt/sources.list.d/puppet.list'
cd ~ && wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb

sudo apt-get update
sudo apt-get install puppet-agent


