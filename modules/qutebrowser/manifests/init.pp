class qutebrowser( $repo ) {

  package { 'tox':
    ensure => 'present'
  }

  $app_folder  = "$base::userhome/Apps"
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

  file { "$base::userhome/bin/qutebrowser":
    source  => "puppet:///modules/qutebrowser/qutebrowser",
    mode    => '0755'
  }

  file { "$base::userhome/.local/share/applications/Qutebrowser.desktop":
    source  => "puppet:///modules/qutebrowser/Qutebrowser.desktop"
  }
  

}
