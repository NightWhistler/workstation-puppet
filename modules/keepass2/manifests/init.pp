class keepass2 {

  #Some prequisites
  package { ['mono-dmcs', 'libmono-system-management4.0-cil', 'xdotool']:
    ensure => installed
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

}
