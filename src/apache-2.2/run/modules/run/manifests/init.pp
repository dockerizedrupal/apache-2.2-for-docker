class run {
  require run::user

  include run::apache22
  include run::apache22::permissions

  if $kerberos_1_realm {
    include run::kerberos
  }
}
