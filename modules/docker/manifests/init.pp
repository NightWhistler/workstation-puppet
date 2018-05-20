class docker {

  $docker_prereq = ['apt-transport-https', 'ca-certificates', 'curl', 'software-properties-common']

  package { $docker_prereq:
    ensure => 'installed'
  }

  apt::key { 'docker':
    id         => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
    source => 'https://download.docker.com/linux/ubuntu/gpg',
    require => Package[$docker_prereq]
  }

  apt::source { 'docker':
    location => '[arch=amd64] https://download.docker.com/linux/ubuntu',
    repos    => 'stable',
    require  => Apt::Key['docker']
  }

  package { 'docker-ce':
    ensure    => 'installed',
    require   => Apt::Source['docker']
  }

}
