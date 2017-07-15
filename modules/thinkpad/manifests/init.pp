class thinkpad {

  apt::ppa { 'ppa:linrunner/tlp': }
  $packages = ['tlp', 'tp-smapi-dkms', 'acpi-call-dkms']

  package { $packages: 
      require => Apt::Ppa['ppa:linrunner/tlp'],
      ensure  => 'installed',
  }


}
