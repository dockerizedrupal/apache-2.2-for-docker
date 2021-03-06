class run::apache22::permissions {
  require run::user
  require run::apache22

  bash_exec { 'chown -R container.container /var/lib/apache2': }

  bash_exec { "chown -R container.container $document_root":
    timeout => 0
  }

  bash_exec { 'chown -R container.container /apache/ssl': }
}
