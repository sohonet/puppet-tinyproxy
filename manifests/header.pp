# == Define tinyproxy::header
#
# Inserts a HTTP header
#
# === Parameters
#
# [*namevar*]
#   Required. Name of header
#
# [*value*]
#   Required. Value of header
#
# [*ensure*]
#   Optional. Ensure parameter
#
# === Sample usage
#
# tinyproxy::header { 'X-My-Header':
#   ensure  => present,
#   value   => 'MyValue',
# }
#
define tinyproxy::header (
  $value,
  $ensure = 'present',
) {
  include tinyproxy::params
  concat::fragment { "tinyproxy_header_${name}":
    ensure  => $ensure,
    target  => $tinyproxy::params::configfile,
    content => "AddHeader \"${name}\" \"${value}\"\n",
    order   => 20,
  }
}
