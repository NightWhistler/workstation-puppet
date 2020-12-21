class keepassxc {

  apt::ppa { 'ppa:phoerious/keepassxc': } ~> 

  exec { 'keepassxc_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    refreshonly => true,
  } ~>

  package { ['keepassxc']:
    ensure      => installed
  }

}
