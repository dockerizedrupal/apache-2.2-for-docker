class run {
  require run::user
  include run::user::permissions

  include run::apache22

  if $kerberos_1_realm {
    include run::kerberos
  }
}
