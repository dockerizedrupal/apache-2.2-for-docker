class run {
  require run::user

  include run::apache22
  include run::apache22::permissions
  include run::timezone

  if $kerberos_1_realm {
    include run::kerberos
  }

  if $esteid == "On" {
    include run::esteid
  }
}
