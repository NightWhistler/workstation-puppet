class myuser( $username ) {

  $userhome = "/home/${username}"

  package { 'zsh': ensure => 'installed' }

  user { $username: 
    ensure => 'present',
    shell   => '/bin/zsh',
    require => Package['zsh'],
    home    => $userhome
  }

  $bin_dir = "$userhome/bin"
  $app_dir = "$userhome/Apps"
  $desktop_dir = "$userhome/Desktop"
  $downloads_dir = "$userhome/Downloads"
  $documents_dir = "$userhome/Documents"
  $music_dir = "$userhome/Music"
  $pictures_dir = "$userhome/Pictures"
  $source_dir = "$userhome/Source"

  file { [ $userhome,
      $bin_dir,
      $app_dir,
      $desktop_dir,
      $downloads_dir,
      $documents_dir,
      $music_dir,
      $pictures_dir,
      $source_dir ]:
    ensure => 'directory',
    owner  => $username,
    group  => $username,
  }

  ohmyzsh::install { $username: }

}
