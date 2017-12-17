class firefoxplugins {

    require 'wget'

    $addons = [
        ['https://addons.mozilla.org/firefox/downloads/file/813174/vimium_ff-1.62.6-an+fx.xpi', 'vimium_ff-1.62.6-an+fx.xpi']
    ]

    $addons.each | $addon | {
        wget::fetch { $addon[0]:
            destination =>  "/usr/lib/firefox/distribution/extensions/${addon[1]}"
        }
    }
}
