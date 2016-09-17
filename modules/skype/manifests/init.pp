class skype {

  $user     = hiera('user')
  $userhome = "/home/${user}"

  require 'wget'

  $skype_prereq = [ 'libc6:i386','libx11-6:i386','libxext6:i386','libxss1:i386','libxv1:i386','libssl1.0.0:i386','libpulse0:i386','libasound2-plugins:i386','libqt4-dbus:i386','libqt4-network:i386','libqt4-xml:i386','libqtcore4:i386','libqtgui4:i386','libqtwebkit4:i386','sni-qt','sni-qt:i386']

  package { $skype_prereq:
    ensure  => 'installed',
  }

  wget::fetch { 'skype.deb':
      destination => "${userhome}/Downloads/skype.deb",
      source      => "http://www.skype.com/go/getskype-linux-beta-ubuntu-64",
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

  file_line { 'Fix ugly skype under i3':
      path => '/etc/xdg/Trolltech.conf',  
      line => 'style=GTK+',
  }

}
