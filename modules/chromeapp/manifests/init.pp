class chromeapp( $displayName, $url ) {

    require 'googlechrome'

    $user     = hiera('user')
    $userhome = "/home/${user}"

    file { "${userhome}/.local/share/applications/${displayName}.desktop":
        content     => epp('chromeapp/shortcut.desktop')
    }

}
