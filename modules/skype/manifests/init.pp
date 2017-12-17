class skype {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  require 'wget'

  wget::fetch { 'skype.deb':
      destination => "${userhome}/Downloads/skype.deb",
      source      => "https://repo.skype.com/latest/skypeforlinux-64.deb",
      timeout     => 0,
      verbose     => false,
      require     => Package[$skype_prereq]
  }
  
  package { 'skype':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "${userhome}/Downloads/skype.deb",
    require   => Wget::Fetch['skype.deb']
  }

}
