class php {
  $php52 = dnsLookup($php52)

  if $php52 {
    file { '/etc/apache2/conf.d/php52':
      ensure => present,
      content => template('php/php52.erb'),
      mode => 644
    }
  }

  $php53 = dnsLookup($php53)

  if $php53 {
    file { '/etc/apache2/conf.d/php53':
      ensure => present,
      content => template('php/php53.erb'),
      mode => 644
    }
  }

  $php54 = dnsLookup($php54)

  if $php54 {
    file { '/etc/apache2/conf.d/php54':
      ensure => present,
      content => template('php/php54.erb'),
      mode => 644
    }
  }

  $php55 = dnsLookup($php55)

  if $php55 {
    file { '/etc/apache2/conf.d/php55':
      ensure => present,
      content => template('php/php55.erb'),
      mode => 644
    }
  }

  $php56 = dnsLookup($php56)

  if $php56 {
    file { '/etc/apache2/conf.d/php56':
      ensure => present,
      content => template('php/php56.erb'),
      mode => 644
    }
  }
}
