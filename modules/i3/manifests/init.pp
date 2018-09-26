class i3 {

  require myuser

  $user = $myuser::username
  $userhome = $myuser::userhome

  package { 'i3':
    ensure => installed
  }

  file { '/etc/i3/config':
    ensure  => 'present',
    source  => 'puppet:///modules/i3/i3_config',
    require => Package['i3']
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

  file { '/lib/systemd/system/i3lock@.service':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source =>  'puppet:///modules/i3/i3lock.service'
  }~>
  exec { 'i3lock-systemd-reload':
    command     => 'systemctl daemon-reload',
    path        => [ '/usr/bin', '/bin', '/usr/sbin' ]
  }~> 
  exec { 'i3lock-enable':
    command     => "systemctl enable i3lock@${user}.service",
    path        => [ '/usr/bin', '/bin', '/usr/sbin' ]
  }

  
}
