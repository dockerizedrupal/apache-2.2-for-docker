class run::apache22 {
  require run::user

  if $php_host {
    include run::apache22::conf_d::php
  }

  include run::apache22::conf_d::server_name
  include run::apache22::conf_d::timeout

  if $http_basic_auth == "On" {
    include run::apache22::http_basic_auth
  }

  if $http and $https {
    if ! file_exists('/apache/ssl/certs/apache-2.2.crt') {
      require run::apache22::ssl
    }

    file { '/etc/apache2/sites-available/http_https':
      ensure => present,
      content => template('run/http_https.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http_https':
      ensure => link,
      target => '/etc/apache2/sites-available/http_https',
      require => File['/etc/apache2/sites-available/http_https']
    }

    file { '/etc/apache2/sites-available/http_https-ssl':
      ensure => present,
      content => template('run/http_https-ssl.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http_https-ssl':
      ensure => link,
      target => '/etc/apache2/sites-available/http_https-ssl',
      require => File['/etc/apache2/sites-available/http_https-ssl']
    }
  }
  elsif $http {
    file { '/etc/apache2/sites-available/http':
      ensure => present,
      content => template('run/http.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http':
      ensure => link,
      target => '/etc/apache2/sites-available/http',
      require => File['/etc/apache2/sites-available/http']
    }
  }
  elsif $https {
    if ! file_exists('/apache/ssl/certs/apache-2.2.crt') {
      require run::apache22::ssl
    }

    file { '/etc/apache2/sites-available/https':
      ensure => present,
      content => template('run/https.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/https':
      ensure => link,
      target => '/etc/apache2/sites-available/https',
      require => File['/etc/apache2/sites-available/https']
    }

    file { '/etc/apache2/sites-available/https-ssl':
      ensure => present,
      content => template('run/https-ssl.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/https-ssl':
      ensure => link,
      target => '/etc/apache2/sites-available/https-ssl',
      require => File['/etc/apache2/sites-available/https-ssl']
    }
  }

  bash_exec { 'mkdir -p /apache/data': }

  bash_exec { 'rm -rf /var/run/apache2/apache2.pid': }
}
