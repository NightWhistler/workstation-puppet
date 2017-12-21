class base( $packages, $classes ) {

  $user     = lookup('user')
  $userhome = "/home/${user}"

  package { $packages: 
      ensure  => 'installed',
  }

  include $classes
  include apt
  include wget

  package { 'zsh': ensure => 'installed' }

  user { $user: 
    ensure => 'present',
    shell   => '/bin/zsh',
    require => Package['zsh'],
    home    => $userhome
  }

  file { [ $userhome,
          "${userhome}/bin",
          "${userhome}/Apps",
          "${userhome}/Desktop",
          "${userhome}/Downloads",
          "${userhome}/Documents",
          "${userhome}/Music",
          "${userhome}/Pictures",
          "${userhome}/Source"]:
    ensure => 'directory',
    owner  => $user,
    group  => $user,
  }


  #Work-around to make sure the Owncloud icon is shown.
  if $facts['os']['release']['full'] == '16.04' {
      package { 'appmenu-qt5':
          ensure => 'absent',
      }
  }

  ohmyzsh::install { $user: }

}
