class firefoxplugins {

    require 'wget'

    $addons = [
        'https://addons.mozilla.org/firefox/downloads/latest/vimperator/addon-450078-latest.xpi',
        'https://addons.mozilla.org/firefox/downloads/latest/hide-tab-bar-with-one-tab/addon-429664-latest.xpi',
        'https://addons.mozilla.org/firefox/downloads/latest/keefox/platform:2/addon-306880-latest.xpi'
    ]

    wget::fetch { $addons:
        destination =>  '/usr/lib/firefox/browser/extensions/'
    }

}
