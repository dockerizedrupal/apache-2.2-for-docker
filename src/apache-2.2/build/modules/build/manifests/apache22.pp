class build::apache22 {
  require build::apache22::packages
  require build::apache22::supervisor

  include build::apache22::logs

  bash_exec { 'usermod -d /apache/data www-data': }

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

  file { '/etc/apache2/conf.d/security':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf.d/security',
    mode => 644
  }

  bash_exec { 'mkdir -p /etc/htpasswd': }
}
