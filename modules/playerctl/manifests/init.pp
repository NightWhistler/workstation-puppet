class playerctl( $version ) {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  require 'wget'

  $debfile = "playerctl-${version}_amd64.deb"

  wget::fetch { $debfile:
      destination => "${userhome}/Downloads/$debfile",
      source      => "https://github.com/acrisci/playerctl/releases/download/v$version/$debfile",
      timeout     => 0,
      verbose     => false,
  }
  
  package { 'playerctl':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "${userhome}/Downloads/$debfile",
    require   => Wget::Fetch[$debfile]
  }

}
