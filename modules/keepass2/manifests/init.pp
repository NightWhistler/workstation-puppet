class keepass2 {

  apt::source { 'mono':
      location => 'https://download.mono-project.com/repo/ubuntu',
      release  => 'stable-bionic',
      repos    => 'main',
      key      => {
        'id'     => '3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
        'server' => 'hkp://keyserver.ubuntu.com:80',
      }
  } ~> 
  apt::ppa { 'ppa:jtaylor/keepass': } ~> 

  exec { 'keepass_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    refreshonly => true,
  } ~>

  package { ['mono-complete', 'libmono-system-management4.0-cil', 'xdotool', 'keepass2']:
    ensure      => installed
  }

}
