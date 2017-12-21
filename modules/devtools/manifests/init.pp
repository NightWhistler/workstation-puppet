class devtools( $packages, $classes ) {
    require base

    include $classes

    package { $packages:
        ensure  => 'installed'
    }

    class {'docker::compose': 
      ensure => present,
    }

    file { "${base::userhome}/bin/git-meld":
        ensure  => 'present',
        source  => 'puppet:///modules/devtools/git-meld',
        mode    => '0755'
    }

}


