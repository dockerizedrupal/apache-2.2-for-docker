class build::apache22 {
  require build::apache22::packages
  require build::apache22::supervisor

  bash_exec { 'usermod -d /apache-2.2/data www-data': }

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod fastcgi': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }

  file { '/var/www/index.html':
    ensure => absent
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/envvars',
    mode => 755
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }

  file { '/etc/apache2/conf.d/logs':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf.d/logs',
    mode => 644
  }
}
