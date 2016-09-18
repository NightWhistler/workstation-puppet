class chromeapp {

    require 'googlechrome'

    $user     = hiera('user')
    $userhome = "/home/${user}"

}
