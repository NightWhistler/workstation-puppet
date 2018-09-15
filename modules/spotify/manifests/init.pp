class spotify {
  
  require 'apt'

  apt::source { 'spotify':
      location => 'http://repository.spotify.com',
      release  => 'stable',
      repos    => 'non-free',
      key      => {
        'id'     => '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
        'server' => 'hkp://keyserver.ubuntu.com:80',
      },
  }

  exec { 'spotify_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Source['spotify'],
    refreshonly => true,
  }

  package { 'spotify-client':
    ensure  => 'installed',
    require => Exec['spotify_apt_get_update']
  }
}
