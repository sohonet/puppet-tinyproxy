# == Define tinyproxy::reversepath
#
# Configures reverse proxy path mappings
#
# === Parameters
#
# [*namevar*]
#   Required. Description of reverse proxy path mapping
#
# [*path*]
#   Required. Path to proxy
#
# [*target*]
#   Required. Target URL of proxy
#
define tinyproxy::reversepath (
  $path,
  $target,
) {
  include tinyproxy::params
  concat::fragment { "tinyproxy_reversepath_${name}":
    target  => $tinyproxy::params::configfile,
    content => "ReversePath \"${path}\" \"${target}\"\n",
    order   => 50
  }
}
