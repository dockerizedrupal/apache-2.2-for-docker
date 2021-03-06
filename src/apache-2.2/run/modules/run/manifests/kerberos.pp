class run::kerberos {
  file { '/etc/krb5.conf':
    ensure => present,
    content => template('run/krb5.conf.erb'),
    mode => 644
  }

  if file_exists('/etc/apache2/kerberos.krb5keytab') {
    file { '/etc/apache2/sites-available/kerberos':
      ensure => present,
      content => template('run/kerberos.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/kerberos':
      ensure => link,
      target => '/etc/apache2/sites-available/kerberos',
      require => File['/etc/apache2/sites-available/kerberos']
    }
  }
}
