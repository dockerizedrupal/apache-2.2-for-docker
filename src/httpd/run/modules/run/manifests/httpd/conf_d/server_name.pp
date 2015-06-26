class run::httpd::conf_d::server_name {
  file { '/etc/apache2/conf.d/server_name':
    ensure => present,
    content => template('run/server_name.erb'),
    mode => 644
  }
}
