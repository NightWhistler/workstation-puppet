class googlechrome {

  require myuser
  require wget

  $downloads_dir = $myuser::downloads_dir

  package { 'libappindicator1':
    ensure  => 'installed'
  }

  wget::fetch { 'google-chrome.deb':
      destination => "$downloads_dir/google-chrome.deb",
      source      => "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb",
      timeout     => 0,
      verbose     => false,
  }
  
  package { 'google-chrome-stable':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "$downloads_dir/google-chrome.deb",
    require   => Wget::Fetch['google-chrome.deb']
  }

}
