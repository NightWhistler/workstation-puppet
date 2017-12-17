class qutebrowser( $repo ) {

  package { 'tox':
    ensure => 'present'
  }

  $qute_folder = "$base::userhome/Apps/qutebrowser"

  exec { 'clone_qutebrowser':
    command => "/usr/bin/git clone $repo $qute_folder",
    creates => $quteFolder,
    cwd     => $appFolder,
    require => Package['git']
  }

  exec { '/usr/bin/tox -e mkvenv-pypi':
    creates  => "$quteFolder/.venv",
    cwd      => $quteFolder,
    require  => Exec['clone_qutebrowser']
  } 

  file { "$base::userhome/bin/qutebrowser":
    source  => "puppet:///modules/qutebrowser/qutebrowser",
    mode    => '0755'
  }

  file { "$base::userhome/.local/share/applications/Qutebrowser.desktop":
    source  => "puppet:///modules/qutebrowser/Qutebrowser.desktop"
  }
  

}
