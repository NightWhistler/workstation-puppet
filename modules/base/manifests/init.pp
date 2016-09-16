class base {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  user { $user: ensure => 'present' }

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
        #Basic i3 desktop
        'ubuntu-desktop', 'i3','j4-dmenu-desktop','suckless-tools','python-setuptools','python-pip','python-gobject',
        'python-yaml','libgio2.0','gobject-introspection','libgtk2.0-0','libnotify4',
        'gettext','gir1.2-notify-0.7','gnome-settings-daemon','feh','ranger','compton','rofi',
        'redshift-gtk','gksu','gnome-tweak-tool','network-manager-openvpn-gnome', 'ppa-purge'
        ,'ubuntu-restricted-extras','unity-tweak-tool','owncloud-client',
        
        'zsh','terminator','htop','screen','unsort','nmap','pwgen','pidgin','pidgin-otr', 'gimp','inkscape','vlc','keepass2','mono-dmcs','libmono-system-management4.0-cil','xdotool',
        'p7zip-full','remmina'
        
  ]

  package { $packages: 
      ensure  => 'installed',
  }

  ohmyzsh::install { $user: }

  include 'apt'
  include 'wget'

  class { 'skype':
      userhome  => $userhome
  }

  include 'spotify'

  class { 'googlechrome':
      userhome  => $userhome
  }

  
#'hipchat'

}
