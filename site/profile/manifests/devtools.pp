class profile::devtools( $packages, $classes ) {

  require profile::base

  include $classes

  package { $packages:
    ensure  => 'installed'
  }

  class {'docker::compose': 
    ensure => present,
  }

}
