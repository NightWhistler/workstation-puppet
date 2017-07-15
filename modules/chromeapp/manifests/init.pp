class chromeapp( $apps ) {

    require 'googlechrome'

    $user     = hiera('user')
    $userhome = "/home/${user}"

    file { ["${chromeapp::userhome}/.local/","${chromeapp::userhome}/.local/share/","${chromeapp::userhome}/.local/share/applications/"]:
        ensure  => 'directory'
    }

    $apps.each | $app | {
      chromeapp::app { $app['name']:
         displayName    => $app['displayName'],
         url            => $app['url']
      }
    }

}
