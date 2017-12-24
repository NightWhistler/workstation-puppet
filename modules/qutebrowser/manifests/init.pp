class qutebrowser( $repo ) {

  require myuser

  package { 'tox':
    ensure => 'present'
  }

  $userhome    = $myuser::userhome
  $app_dir  = $myuser::app_dir
  $bin_dir  = $myuser::bin_dir

  $qute_dir = "$app_dir/qutebrowser"

  exec { 'clone_qutebrowser':
    command => "/usr/bin/git clone $repo $qute_dir",
    creates => $qute_dir,
    cwd     => $app_dir,
    require => Package['git']
  }

  exec { '/usr/bin/tox -e mkvenv-pypi':
    creates  => "$qute_dir/.venv",
    cwd      => $qute_dir,
    require  => Exec['clone_qutebrowser']
  } 

  file { "$bin_dir/qutebrowser":
    ensure => file,
    source => "puppet:///modules/qutebrowser/qutebrowser",
    mode   => '0755'
  }

  file { "$bin_dir/quteqr":
    ensure => file,
    source  => "puppet:///modules/qutebrowser/quteqr",
    mode    => '0755'
  }

  file { "$userhome/.local/share/applications/Qutebrowser.desktop":
    ensure => file,
    source  => "puppet:///modules/qutebrowser/Qutebrowser.desktop"
  }
  

}
