class i3::fix_systray {

  require apt

  apt::ppa { 'ppa:fixnix/indicator-systemtray-unity': }

  exec { 'systray_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
    subscribe   => Apt::Ppa['ppa:fixnix/indicator-systemtray-unity'],
    refreshonly => true,
  }

  package { 'indicator-systemtray-unity':
    ensure   => 'installed',
    require  => Exec['systray_apt_get_update'],
  }

}
