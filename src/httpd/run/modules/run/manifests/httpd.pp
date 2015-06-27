class run::httpd {
  if $php_host {
    include run::httpd::conf_d::php
  }

  include run::httpd::conf_d::server_name
  include run::httpd::conf_d::timeout

  if $http and $https {
    if ! file_exists('/httpd/ssl/certs/httpd.crt') {
      require run::httpd::ssl
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
    if ! file_exists('/httpd/ssl/certs/httpd.crt') {
      require run::httpd::ssl
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

  bash_exec { 'mkdir -p /httpd/data': }

  bash_exec { 'chown container.container /var/lib/apache2/fastcgi': }
}
