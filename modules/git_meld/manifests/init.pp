class git_meld {

  require myuser

  $destination = $myuser::bin_dir

  file { "$destination/git-meld":
    ensure  => 'present',
    source  => 'puppet:///modules/git_meld/git-meld',
    mode    => '0755'
  }

}
