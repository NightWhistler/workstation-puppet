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

  include 'apt'
  include 'wget'

  apt::ppa { 'ppa:jtaylor/keepass': }

  $packages = [
        'ubuntu-desktop', 'redshift-gtk','gksu','gnome-tweak-tool','network-manager-openvpn-gnome', 'ppa-purge' ,'ubuntu-restricted-extras','unity-tweak-tool','owncloud-client', 'terminator','htop','screen','unsort','nmap','pwgen','pidgin','pidgin-otr', 'gimp','inkscape','vlc','keepass2','mono-dmcs','libmono-system-management4.0-cil','xdotool', 'p7zip-full','remmina', 'tmux', 'urlview', 'xbacklight', 'arandr'
  ]

  package { $packages: 
      require => Apt::Ppa['ppa:jtaylor/keepass'],
      ensure  => 'installed',
  }

#Work-around to make sure the Owncloud icon is shown.
  if $facts['os']['release']['full'] == '16.04' {
      package { 'appmenu-qt5':
          ensure => 'absent',
      }
  }

  class {'::unattended_upgrades':
    period    => '1',
    repos     => {
        stable => {
          label => 'Debian-Security',
        },
    },
    blacklist => [],
  }

  ohmyzsh::install { $user: }

  include 'skype'
  include 'spotify'
  include 'steam'

  include 'googlechrome'

  include 'chromeapp'

}
