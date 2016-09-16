class i3 {

  $packages = [ 'i3','j4-dmenu-desktop','suckless-tools','python-setuptools','python-pip','python-gobject', 'python-yaml','libgio2.0','gobject-introspection','libgtk2.0-0','libnotify4', 'gettext','gir1.2-notify-0.7','gnome-settings-daemon','feh','ranger','compton','rofi', 'udiskie']

  package { $packages:
      ensure  => installed
  }

  require 'apt'

 #Fixes systray
  apt::ppa { 'ppa:fixnix/indicator-systemtray-unity': }

  package { 'indicator-systemtray-unity':
    ensure   => 'installed',
    require  => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
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

}
