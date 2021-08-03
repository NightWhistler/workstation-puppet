class skype {

  require myuser
  require wget

  $downloads_dir = $myuser::downloads_dir
  #$skype_prereq = ['gconf-service']
  $skype_prereq = []

  wget::fetch { 'skype.deb':
      destination => "$downloads_dir/skype.deb",
      source      => "https://repo.skype.com/latest/skypeforlinux-64.deb",
      timeout     => 0,
      verbose     => false,
      require     => Package[$skype_prereq]
  }
  
  package { 'skype':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "$downloads_dir/skype.deb",
    require   => Wget::Fetch['skype.deb']
  }

}
