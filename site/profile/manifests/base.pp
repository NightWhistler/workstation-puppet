class profile::base( $packages, $classes ) {

  package { $packages: 
      ensure  => 'installed',
  }

  include $classes
  include apt
  include wget

  #Work-around to make sure the Owncloud icon is shown.
  if $facts['os']['release']['full'] == '16.04' {
      package { 'appmenu-qt5':
          ensure => 'absent',
      }
  }

}
