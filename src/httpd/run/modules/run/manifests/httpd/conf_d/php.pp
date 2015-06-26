class run::httpd::conf_d::php {
  file { '/etc/apache2/conf.d/php':
    ensure => present,
    content => template('run/php.erb'),
    mode => 644
  }
}
