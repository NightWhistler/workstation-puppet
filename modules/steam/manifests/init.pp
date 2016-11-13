class steam {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  require 'wget'

  package { 'python-apt':
    ensure  => 'installed'
  }

  wget::fetch { 'steam.deb':
      destination => "${userhome}/Downloads/steam.deb",
      source      => "https://steamcdn-a.akamaihd.net/client/installer/steam.deb",
      timeout     => 0,
      verbose     => false,
      require     => Package['python-apt']
  }
  
  package { 'steam':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "${userhome}/Downloads/steam.deb",
    require   => Wget::Fetch['steam.deb']
  }

}
