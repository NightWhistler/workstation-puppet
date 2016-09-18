define chromeapp::app(String $displayName, String $url ) {

    require 'googlechrome'

    include 'chromeapp'


    file { "${chromeapp::userhome}/.local/share/applications/${displayName}.desktop":
        content     => epp('chromeapp/shortcut.desktop')
    }

}
