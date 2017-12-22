class steam {

  require myuser
  require wget

  $downloads_dir = $myuser::downloads_dir

  package { 'python-apt':
    ensure  => 'installed'
  }

  wget::fetch { 'steam.deb':
      destination => "$downloads_dir/steam.deb",
      source      => "https://steamcdn-a.akamaihd.net/client/installer/steam.deb",
      timeout     => 0,
      verbose     => false,
      require     => Package['python-apt']
  }
  
  package { 'steam':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "$downloads_dir/steam.deb",
    require   => Wget::Fetch['steam.deb']
  }

}
