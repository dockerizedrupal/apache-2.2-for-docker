class build::apache22::packages {
  package {[
      'apache2',
      'libapache2-mod-fastcgi'
    ]:
    ensure => present
  }
}
