class devtools {
    $user     = hiera('user')
    $userhome = "/home/${user}"

    $packages = [

        'build-essential','git','gitk','myrepos','meld','vim','vim-gtk','vagrant','virtualbox','dnsmasq', 'gradle', 'maven', 'scala', 'groovy'

    ]

#'sdkman','intellij',

    package { $packages:
        ensure  => 'installed'
    }

    include 'docker'
    include 'intellij'

    class {'docker::compose': 
      ensure => present,
    }

    include java8

    exec { 'gdub':
        creates => '/usr/local/bin/gw',
        command => '/usr/bin/curl -sLo- http://get.bpkg.io | /bin/bash && /usr/local/bin/bpkg install dougborg/gdub -g'
    }

    file { "${userhome}/bin/git-meld":
        ensure  => 'present',
        source  => 'puppet:///modules/devtools/git-meld',
        mode    => '0755'
    }
}


