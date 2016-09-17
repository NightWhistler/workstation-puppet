class base {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  user { $user: 
	ensure => 'present',
	shell =>  '/bin/zsh'
  }

  # Directory structure #############################################
  file { ["${userhome}/bin",
          "${userhome}/Apps",
          "${userhome}/Desktop",
          "${userhome}/Downloads",
          "${userhome}/Documents",
          "${userhome}/Music",
          "${userhome}/Pictures",
          "${userhome}/Source"]:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
  }

  $packages = [
        'ubuntu-desktop', 'redshift-gtk','gksu','gnome-tweak-tool','network-manager-openvpn-gnome', 'ppa-purge' ,'ubuntu-restricted-extras','unity-tweak-tool','owncloud-client', 'zsh','terminator','htop','screen','unsort','nmap','pwgen','pidgin','pidgin-otr', 'gimp','inkscape','vlc','keepass2','mono-dmcs','libmono-system-management4.0-cil','xdotool', 'p7zip-full','remmina'
  ]

  package { $packages: 
      ensure  => 'installed',
  }

  include 'apt'
  include 'wget'

  ohmyzsh::install { $user: }
 
  class { 'skype':
      userhome  => $userhome
  }

  include 'spotify'

  class { 'googlechrome':
      userhome  => $userhome
  }

  
#'hipchat'

}
