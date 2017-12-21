class intellij( $version ) {

    require 'base'

    $userhome = $base::userhome
    $ideaPath = "${userhome}/Apps/idea-IU-${version}"

    file { $ideaPath:
        ensure        => 'directory'
    }

    archive { 'intellij.tar.gz':
      source          => "https://download.jetbrains.com/idea/ideaIU-${version}.tar.gz",
      path            => "${userhome}/Downloads/intellij.tar.gz",
      extract         => true,
      cleanup         => true,
      extract_path    => $ideaPath,
      creates         => "${ideaPath}/bin/idea.sh",
      extract_command => 'tar xfz %s --strip-components=1',
    }

    file { "${userhome}/.local/share/applications/jetbrains-idea.desktop":
        content => epp('intellij/jetbrains-idea.desktop')

    }

}
