# == Define tinyproxy::noupstream
#
# Configure exceptions to upstream proxy
#
# === Parameters
#
# [*namevar*]
#   Required. Description of no upstream proxy mapping
#
# [*match*]
#   Required. Matching host or domain to not proxy
#
# === Sample usage
#
# tinyproxy::noupstream { 'no_proxy_my_other_site_com':
#   ensure  => present,
#   match   => 'my.other.site.com',
# }
#
define tinyproxy::noupstream (
  $match,
) {
  include tinyproxy::params
  concat::fragment { "tinyproxy_noupstream_${name}":
    target  => $tinyproxy::params::configfile,
    content => "no upstream \"${match}\"\n",
    order   => 40,
  }
}
