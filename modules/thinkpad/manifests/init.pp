#There is actually some generic laptop stuff in here too which I should probably split into its own class at some point.
class thinkpad {

  apt::ppa { 'ppa:linrunner/tlp': }
  $packages = ['tlp', 'tp-smapi-dkms', 'acpi-call-dkms']

  exec { 'tlp_apt_get_update':
    command     => 'apt-get update',
    cwd         => '/tmp',
    path        => ['/usr/bin'],
    require     => Apt::Ppa['ppa:linrunner/tlp'],
    subscribe   => Apt::Ppa['ppa:linrunner/tlp'],
    refreshonly => true,
  }

  package { $packages: 
      require => Exec['tlp_apt_get_update'],
      ensure  => 'installed',
  }

}
