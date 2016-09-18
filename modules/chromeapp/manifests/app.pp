define chromeapp::app(String $displayName, String $url ) {

    include 'chromeapp'

    file { "${chromeapp::userhome}/.local/share/applications/${displayName}.desktop":
        content     => epp('chromeapp/shortcut.desktop', { displayName => $displayName, url => $url})
    }

}
