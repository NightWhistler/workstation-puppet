class intellij {

    $user     = hiera('user')
    $userhome = "/home/${user}"

    $release = '2016.2.4'
    $build = '162.2032.8'

    archive { 'intellij.tar.gz':
      source          => "https://download.jetbrains.com/idea/ideaIU-${release}.tar.gz",
      path            => "${userhome}/Downloads/intellij.tar.gz",
      extract         => true,
      cleanup         => true,
      extract_path    => "${userhome}/Apps/",
      creates         => "${userhome}/Apps/idea-IU-${build}",
    }

    file { "${userhome}/.local/share/applications/jetbrains-idea.desktop":
        content => epp('intellij/jetbrains-idea.desktop')

    }

}
