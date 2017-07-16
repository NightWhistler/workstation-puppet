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

  class { 'apt':
    always_apt_update => true,
  }

  include 'wget'

    $packages = [
        'ubuntu-desktop', 'redshift-gtk','gksu','gnome-tweak-tool','network-manager-openvpn-gnome', 'ppa-purge' ,'ubuntu-restricted-extras','unity-tweak-tool','owncloud-client', 'terminator','htop','screen','unsort','nmap','pwgen','pidgin','pidgin-otr', 'gimp','inkscape','vlc','mono-dmcs','libmono-system-management4.0-cil','xdotool', 'p7zip-full','remmina', 'tmux', 'urlview', 'xbacklight', 'arandr'
  ]

  package { $packages: 
      ensure  => 'installed',
  }

  apt::ppa { 'ppa:jtaylor/keepass': }

  exec { 'keepass_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:jtaylor/keepass'],
    subscribe   => Apt::Ppa['ppa:jtaylor/keepass'],
    refreshonly => true,
  }

  package { 'keepass2':
      require => Exec['keepass_apt_get_update'],
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
