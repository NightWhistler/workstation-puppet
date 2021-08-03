class regolith {

  apt::ppa { 'ppa:regolith-linux/release': } ~> 

  exec { 'regolith_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    refreshonly => true,
  } ~>

  package { ['regolith-desktop-standard']:
    ensure      => installed
  }

}
