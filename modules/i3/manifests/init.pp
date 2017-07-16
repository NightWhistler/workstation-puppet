class i3 {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  $packages = [ 'i3','j4-dmenu-desktop','suckless-tools','python-setuptools','python-pip','python-gobject', 'python-yaml','libgio2.0','gobject-introspection','libgtk2.0-0','libnotify4', 'gettext','gir1.2-notify-0.7','gnome-settings-daemon','feh','ranger','compton','udiskie']

  package { $packages:
      ensure  => installed
  }

  require 'apt'

  apt::ppa { 'ppa:aguignard/ppa': }

  exec { 'rofi_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:aguignard/ppa'],
    subscribe   => Apt::Ppa['ppa:aguignard/ppa'],
    refreshonly => true,
  }
    
  package { 'rofi':
       ensure => 'installed',
       require => Exec['rofi_apt_get_update']
  }

 #Fixes systray
  apt::ppa { 'ppa:fixnix/indicator-systemtray-unity': }

  exec { 'systray_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
    subscribe   => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
    refreshonly => true,
  }

  package { 'indicator-systemtray-unity':
    ensure   => 'installed',
    require  => Exec['systray_apt_get_update'],
  }

  file { '/etc/i3/config':
    ensure  => 'present',
    source  => 'puppet:///modules/i3/i3_config'
  }

  file { '/etc/i3status.conf':
    ensure  => 'present',
    source  => 'puppet:///modules/i3/i3status.conf'
  }

  file { '/etc/tmux.conf':
    ensure  => 'present',
    source  => 'puppet:///modules/i3/tmux.conf'
  }

#This fixes the prefs breaking under i3
  exec { 'fix_preferences': 
     command => '/bin/sed -i s/OnlyShowIn=.*$// /usr/share/applications/unity-*-panel.desktop'
  }

#This disables the desktop, so starting Nautilus doesn't mess things up.
  exec { 'disable_icons':
     command => '/usr/bin/gsettings set org.gnome.desktop.background show-desktop-icons false',
     user   => $user
  }

#i3 installs dunst by default, which messes up notifications
  package { 'dunst':
    ensure  => 'purged'
  }

  ['move', 'left_handed_mouse.sh'].each | $script | {
    file { "${userhome}/bin/${script}" :
        ensure  => 'present',
        source  => "puppet:///modules/i3/${script}",
        mode    => '0755'
    }
  }

  include 'playerctl'
  
}
