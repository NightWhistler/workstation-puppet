class profile::regolith_desktop( $packages, $classes ) {

  require profile::base

  include $classes

  package { $packages:
      ensure  => installed
  }

}
