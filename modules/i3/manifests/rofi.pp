class i3::rofi {

  require apt

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
}
