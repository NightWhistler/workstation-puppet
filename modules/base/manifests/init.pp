class base {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  package { 'zsh': ensure => 'installed' }

  user { $user: 
	ensure => 'present',
	shell =>  '/bin/zsh',
    require => Package['zsh']
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
        'ubuntu-desktop', 'redshift-gtk','gksu','gnome-tweak-tool','network-manager-openvpn-gnome', 'ppa-purge' ,'ubuntu-restricted-extras','unity-tweak-tool','owncloud-client', 'terminator','htop','screen','unsort','nmap','pwgen','pidgin','pidgin-otr', 'gimp','inkscape','vlc','keepass2','mono-dmcs','libmono-system-management4.0-cil','xdotool', 'p7zip-full','remmina', 'tmux', 'urlview'
  ]

  package { $packages: 
      ensure  => 'installed',
  }

#Work-around to make sure the Owncloud icon is shown.
  if $facts['os']['release']['full'] == '16.04' {
      package { 'appmenu-qt5':
          ensure => 'absent',
      }
  }
  
  include 'apt'
  include 'wget'

  ohmyzsh::install { $user: }

  include 'skype'
  include 'spotify'
  include 'steam'

  include 'googlechrome'

  include 'chromeapp'

  chromeapp::app { 'netflix':
     displayName    => 'Netflix',
     url            => 'https://netflix.com'
  }

  chromeapp::app { 'whatsapp':
     displayName    => 'Whatsapp Web',
     url            => 'https://web.whatsapp.com'
  }

  chromeapp::app { 'hangouts':
     displayName   =>  'Google Hangouts',
     url           =>  'https://hangouts.google.com'
  }

}
