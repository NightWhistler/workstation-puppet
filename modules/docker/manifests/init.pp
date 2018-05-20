class docker {

  apt::key { 'docker':
    id         => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
    source => 'https://download.docker.com/linux/ubuntu/gpg'
  }

  apt::source { 'docker':
    location => 'https://download.docker.com/linux/ubuntu',
    repos    => 'stable',
    require  => Apt::Key['docker']
  }

  package { 'docker-ce':
    ensure    => 'installed',
    require   => Apt::Source['docker']
  }

}
