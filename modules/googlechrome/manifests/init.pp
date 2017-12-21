class googlechrome {

  require base
  require wget

  $userhome = $base::userhome

  package { 'libappindicator1':
    ensure  => 'installed'
  }

  wget::fetch { 'google-chrome.deb':
      destination => "$userhome/Downloads/google-chrome.deb",
      source      => "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb",
      timeout     => 0,
      verbose     => false,
  }
  
  package { 'google-chrome-stable':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "$userhome/Downloads/google-chrome.deb",
    require   => Wget::Fetch['google-chrome.deb']
  }

}
