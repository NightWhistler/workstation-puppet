class signal {

  # apt::key { 'signal':
  #   id         => 'DBA36B5181D0C816F630E889D980A17457F6FB06',
  #   source => 'https://updates.signal.org/desktop/apt/keys.asc'
  # }

  # apt::source { 'signal':
  #   location => 'https://updates.signal.org/desktop/apt',
  #   repos    => 'main',
  #   require  => Apt::Key['signal']
  # }

  # package { 'signal-desktop':
  #   ensure    => 'installed',
  #   require   => Apt::Source['signal']
  # }

  exec { 'snap_install_signal':
    command => '/usr/bin/snap install signal-desktop',
    creates => '/snap/signal-desktop'
  }


}
