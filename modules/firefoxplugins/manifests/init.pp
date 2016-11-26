class firefoxplugins {

    require 'wget'

    $addons = [
        ['https://addons.mozilla.org/firefox/downloads/latest/vimperator/addon-450078-latest.xpi', 'vimperator@mozdev.org.xpi'],
        ['https://addons.mozilla.org/firefox/downloads/latest/hide-tab-bar-with-one-tab/addon-429664-latest.xpi', '{e5bbc237-c99b-4ced-a061-0be27703295f}.xpi'],
        ['https://addons.mozilla.org/firefox/downloads/latest/keefox/platform:2/addon-306880-latest.xpi', 'keefox@chris.tomlinson.xpi'],
        ['https://addons.mozilla.org/firefox/downloads/latest/xmarks-sync/addon-2410-latest.xpi', 'foxmarks@kei.com.xpi'],
        ['https://addons.mozilla.org/firefox/downloads/latest/jsonview/addon-10869-latest.xpi?src=dp-btn-primary', 'jsonview@brh.numbera.com.xpi']
    ]

    $addons.each | $addon | {
        wget::fetch { $addon[0]:
            destination =>  "/usr/lib/firefox/distribution/extensions/${addon[1]}"
        }
    }

    archive { 'KeePassRPC.plgx':
      path            => '/usr/lib/firefox/distribution/extensions/keefox@chris.tomlinson.xpi',
      extract         => true,
      extract_path    => '/usr/lib/keepass2/',
      extract_command => 'unzip -jo %s deps/KeePassRPC.plgx',
      creates         => '/usr/lib/keepass2/KeePassRPC.plgx',
      require         => Wget::Fetch['https://addons.mozilla.org/firefox/downloads/latest/keefox/platform:2/addon-306880-latest.xpi'],
    }
}
