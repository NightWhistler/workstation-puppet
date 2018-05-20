class tmuxifier( $repo ) {

  require myuser

  $userhome    = $myuser::userhome
  $app_dir  = $myuser::app_dir
  $bin_dir  = $myuser::bin_dir

  $tm_dir = "$app_dir/tmuxifier"

  exec { 'clone_tmuxifier':
    command => "/usr/bin/git clone $repo $tm_dir",
    creates => $tm_dir,
    cwd     => $app_dir,
    require => Package['git']
  }

}
