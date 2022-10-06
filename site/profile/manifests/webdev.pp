class profile::webdev( $packages, $snaps ) {

  require profile::base

  #class { 'nodejs': }

  package { $packages:
    ensure  => 'installed',
    provider => 'apt',
  }

  package { $snaps:
    ensure  => 'installed',
    provider => 'snap',
  }



}
