#!/bin/sh
sudo /opt/puppetlabs/bin/puppet apply --hiera_config hiera.yaml --modulepath /etc/puppetlabs/code/environments/production/modules:./modules:./site: manifests 
