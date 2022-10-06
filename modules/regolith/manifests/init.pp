class regolith {


  apt::key { 'regolith_key':
    id => 'FB9CEE656F304FFCC7A719F9BFE717649A5C3D08',
    source => 'https://regolith-desktop.org/regolith.key'
  }

  apt::source { 'regolith':
     location => 'https://regolith-desktop.org/release-ubuntu-jammy-amd64',
     repos    => 'main',
     require  => Apt::Key['regolith_key']
   }

  package { 'regolith-desktop':
     ensure    => 'installed',
     require   => Apt::Source['regolith']
  }
  
}
