class intellij {

    $user     = hiera('user')
    $userhome = "/home/${user}"

    archive { 'intellij.tar.gz':
      source          => 'https://download.jetbrains.com/idea/ideaIU-2016.2.4.tar.gz',
      path            => "${userhome}/Downloads/intellij.tar.gz",
      extract         => true,
      cleanup         => true,
      extract_path    => "${userhome}/Apps/",
      creates         => "${userhome}/Apps/idea-IU-162.2032.8",
    }

}
