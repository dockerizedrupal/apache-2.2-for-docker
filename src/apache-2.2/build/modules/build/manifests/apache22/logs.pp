class build::apache22::logs {
  require build::apache22::packages

  file { '/etc/apache2/conf.d/logs':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf.d/logs',
    mode => 644
  }

  file { '/var/log/apache2/stdout.log':
    ensure => link,
    target => '/dev/stdout',
    force => true
  }

  file { '/var/log/apache2/stderr.log':
    ensure => link,
    target => '/dev/stderr',
    force => true
  }
}
