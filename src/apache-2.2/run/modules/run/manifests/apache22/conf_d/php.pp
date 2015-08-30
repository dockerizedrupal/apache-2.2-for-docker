class run::apache22::conf_d::php {
  file { '/etc/apache2/conf.d/php':
    ensure => present,
    content => template('run/php.erb'),
    mode => 644
  }
}
