Puppet-based workstation provisioning
=====================================

This project is based on my previous provisioner which used shell scripts.
The big advantage in using Puppet is that it can now also be used to update machines.

This is specifically meant to set up Ubuntu development workstations. It might be useful for other types of work, but your milage may vary.

How I set up a new machine
--------------------------

 1. Pick a spiffy hostname (use pick_hostname.sh on another machine)

 2. Install the machine (basic Ubuntu install, next, next, finish)

 3. Download and unzip this project

 4. Run puppet.sh to install Puppet 4 on the machine

 5. Run provision.sh to actually install all the tools and packages I need.
    This is a seperate step from 2, since this can also be run to update a machine.

 6. Start the owncloud sync client to sync my dotFiles folder 

 7. Symlink the dotFiles to the root of my user's home folder

 8. Profit :)


I am putting this on Github since there is nothing specific to me in this setup, though changes are you'd want to tweak it for your own use... 
Vimperator and i3 are not everyone's cup of tea :)


Known issues
------------

There seem to be some minor ordening problems in adding new apt repos, so often you'll need to run provision.sh twice to get the system fully set up. Slightly annoying but not a show-stopper.
