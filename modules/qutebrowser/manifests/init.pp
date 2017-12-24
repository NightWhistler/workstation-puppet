class qutebrowser( $repo ) {

  require myuser

  package { 'tox':
    ensure => 'present'
  }

  $userhome    = $myuser::userhome
  $app_folder  = $myuser::apps_folder
  $bin_folder  = $myuser::bin_folder

  $qute_folder = "$app_folder/qutebrowser"

  exec { 'clone_qutebrowser':
    command => "/usr/bin/git clone $repo $qute_folder",
    creates => $qute_folder,
    cwd     => $app_folder,
    require => Package['git']
  }

  exec { '/usr/bin/tox -e mkvenv-pypi':
    creates  => "$qute_folder/.venv",
    cwd      => $qute_folder,
    require  => Exec['clone_qutebrowser']
  } 

  file { "$binfolder/qutebrowser":
    source  => "puppet:///modules/qutebrowser/qutebrowser",
    mode    => '0755'
  }

  file { "$binfolder/quteqr":
    source  => "puppet:///modules/qutebrowser/quteqr",
    mode    => '0755'
  }

  file { "$userhome/.local/share/applications/Qutebrowser.desktop":
    source  => "puppet:///modules/qutebrowser/Qutebrowser.desktop"
  }
  

}
