class neovim {

  apt::ppa { 'ppa:neovim-ppa/stable': }

  package { [ 'python3-dev', 'python3-pip', 'silversearcher-ag' ]:
    ensure => 'installed'
  }

  exec { 'neovim_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:neovim-ppa/stable'],
    subscribe   => Apt::Ppa['ppa:neovim-ppa/stable'],
    refreshonly => true,
  }
    
  package { 'neovim':
    ensure  => 'installed',
    require => [Exec['neovim_apt_get_update'], Package[ 'python3-pip-whl']]
  }


}
