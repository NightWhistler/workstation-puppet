class playerctl( $version ) {

  require myuser
  require wget

  $downloads_dir = $myuser::downloads_dir
  $debfile = "playerctl-${version}_amd64.deb"

  wget::fetch { $debfile:
      destination => "$downloads_dir/$debfile",
      source      => "https://github.com/acrisci/playerctl/releases/download/v$version/$debfile",
      timeout     => 0,
      verbose     => false,
  }
  
  package { 'playerctl':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "$downloads_dir/$debfile",
    require   => Wget::Fetch[$debfile]
  }

}
