class steam {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  require 'wget'

  wget::fetch { 'steam.deb':
      destination => "${userhome}/Downloads/steam.deb",
      source      => "https://steamcdn-a.akamaihd.net/client/installer/steam.deb",
      timeout     => 0,
      verbose     => false,
  }
  
  package { 'steam':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "${userhome}/Downloads/steam.deb",
    require   => Wget::Fetch['steam.deb']
  }

}
