class profile::webdev( $packages ) {

  require profile::base

  class { 'nodejs': }

  package { $packages:
    ensure  => 'installed',
    provider => 'npm',
  }

}
