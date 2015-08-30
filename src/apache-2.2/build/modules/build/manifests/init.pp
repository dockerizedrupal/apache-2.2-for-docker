class build {
  require build::user

  include build::apache22
  include build::kerberos
}
