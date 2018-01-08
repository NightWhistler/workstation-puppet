class signal {

  apt::key { 'signal':
    id         => '57F6FB06',
    key_source => 'https://updates.signal.org/desktop/apt/keys.asc'
  }

  apt::source { 'signal':
    location => 'https://updates.signal.org/desktop/apt',
    repos    => 'main',
    require  => Apt::Key['signal']
  }

  package { 'signal-desktop':
    ensure    => 'installed',
    require   => Apt::Source['signal']
  }

}
