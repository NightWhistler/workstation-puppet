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

 4. Run puppet7.sh to install Puppet 7 on the machine (or matching scripts for older versions)

 5. Run provision.sh to actually install all the tools and packages I need.
    This is a seperate step from 2, since this can also be run to update a machine.

 6. Start the owncloud sync client to sync my dotFiles folder 

 7. Symlink the dotFiles to the root of my user's home folder

 8. Profit :)


I am putting this on Github since there is nothing specific to me in this setup, though changes are you'd want to tweak it for your own use... 
Qutebrowser and i3 are not everyone's cup of tea :)

I have tried to make it neatly modular and configurable, so it should be easy to make your own configuration.
