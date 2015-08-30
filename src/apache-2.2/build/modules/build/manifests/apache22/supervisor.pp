class build::apache22::supervisor {
  file { '/etc/supervisor/conf.d/apache-2.2.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/apache-2.2.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/apache-2.2_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/apache-2.2_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/apache-2.2_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/apache-2.2_stderr.conf',
    mode => 644
  }
}
