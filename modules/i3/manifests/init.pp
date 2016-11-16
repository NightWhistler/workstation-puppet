class i3 {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  $packages = [ 'i3','j4-dmenu-desktop','suckless-tools','python-setuptools','python-pip','python-gobject', 'python-yaml','libgio2.0','gobject-introspection','libgtk2.0-0','libnotify4', 'gettext','gir1.2-notify-0.7','gnome-settings-daemon','feh','ranger','compton','udiskie']

  package { $packages:
      ensure  => installed
  }

  apt::ppa { 'ppa:aguignard/ppa': }
    
  package { 'rofi':
       ensure => 'installed',
       require => Apt::Ppa['ppa:aguignard/ppa']
  }

  require 'apt'

 #Fixes systray
  apt::ppa { 'ppa:fixnix/indicator-systemtray-unity': }

  package { 'indicator-systemtray-unity':
    ensure   => 'installed',
    require  => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
  }

  file { '/etc/i3/config':
    ensure  => 'present',
    source  => 'puppet:///modules/i3/i3_config'
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
  
}
