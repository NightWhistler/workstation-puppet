class chromeapp( $apps ) {

    require myuser
    require googlechrome

    $userhome = $myuser::userhome

    $apps.each | $app | {
      chromeapp::app { $app['name']:
         displayName    => $app['displayName'],
         url            => $app['url']
      }
    }

}
