class chromeapp( $apps ) {

    require myuser
    require googlechrome

    $userhome = $myuser::userhome

    file { ["$userhome/.local/","$userhome/.local/share/","$userhome/.local/share/applications/"]:
        ensure  => 'directory'
    }

    $apps.each | $app | {
      chromeapp::app { $app['name']:
         displayName    => $app['displayName'],
         url            => $app['url']
      }
    }

}
