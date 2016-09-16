class devtools {

    $packages = [

        'build-essential','git','gitk','myrepos','meld','vim','vim-gtk','vagrant','virtualbox','dnsmasq'

    ]

#'gdub','sdkman','intellij',

    package { $packages:
        ensure  => 'installed'
    }

    include 'docker'

    class {'docker::compose': 
      ensure => present,
    }

    include java8
}
