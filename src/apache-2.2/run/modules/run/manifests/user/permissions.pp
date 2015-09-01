class run::user::permissions {
  require run::apache22

  bash_exec { 'chown -R container.container /var/lib/apache2': }

  bash_exec { 'chown -R container.container /apache-2.2': }
}
