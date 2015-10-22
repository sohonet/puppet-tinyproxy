# == Define tinyproxy::upstream
#
# Configures a upstream proxy mapping
#
# === Parameters
#
# [*namevar*]
#   Required. Description of upstream proxy mapping
#
# [*proxy*]
#   Required. Server to proxy to
#
# [*match*]
#   Optional. Matching host or domain to proxy
#
# [*ensure*]
#   Optional. Ensure parameter
#
# === Sample usage
#
# tinyproxy::upstream { 'proxy_my_site_com':
#   ensure => 'present',
#   proxy  => 'myserver:8080',
#   match  => 'my.site.com',
# }
#
define tinyproxy::upstream (
  $proxy,
  $match = undef,
  $ensure = present
) {
  include tinyproxy::params
  $content = $match ? {
    undef   => "upstream ${proxy}\n",
    ''      => "upstream ${proxy}\n",
    default => "upstream ${proxy} \"${match}\"\n"
  }
  concat::fragment { "tinyproxy_upstream_${name}":
    ensure  => $ensure,
    target  => $tinyproxy::params::configfile,
    content => $content,
    order   => 30
  }
}
