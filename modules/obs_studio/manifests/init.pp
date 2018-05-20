class obs_studio {

  apt::ppa { 'ppa:obsproject/obs-studio': }

  exec { 'obs_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:obsproject/obs-studio'],
    subscribe   => Apt::Ppa['ppa:obsproject/obs-studio'],
    refreshonly => true,
  }
    
  package { 'obs-studio':
    ensure => 'installed',
    require => Exec['obs_apt_get_update']
  }

}
