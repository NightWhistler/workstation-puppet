class regolith {


  apt::key { 'regolith_key':
    id => 'C91ECAB862037F9474087DBC7107DED133505B88',
    source => 'https://regolith-desktop.org/regolith.key'
  }

  apt::source { 'regolith':
     location => 'https://regolith-desktop.org/release-3_0-ubuntu-jammy-amd64',
     repos    => 'main',
     require  => Apt::Key['regolith_key']
   }

  package { ['regolith-desktop', 'regolith-session-flashback', 'regolith-look-gruvbox']:
     ensure    => 'installed',
     require   => Apt::Source['regolith']
  }
  
}
