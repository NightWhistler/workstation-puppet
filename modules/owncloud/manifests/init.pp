class owncloud {


  apt::key { 'owncloud_key':
    id => '06D7EADE708A40FA136EB4540700205DFD41A71A'
    source => 'https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/Release.key'
  }

  apt::source { 'owncloud':
     location => 'https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Ubuntu_22.04/'
     repos    => 'main',
     require  => Apt::Key['owncloud_key']
   }

  package { 'owncloud-client':
     ensure    => 'installed',
     require   => Apt::Source['owncloud']
  }
  
}
