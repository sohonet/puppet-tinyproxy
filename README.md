What is it?
===========

A Puppet module that manages tinyproxy

A fork of [Johan Lyheden's excellent tinyproxy puppet module](https://github.com/jlyheden/puppet-tinyproxy.git) with the following enhancements:
* Manage the contents of the filter file (via new `filtercontent` parameter)
* Debug support switches DefaultErrorFile to use debug.html (enable via new `debugmode` parameter)
* Manage the XTinyproxy configuration directive (via new `xtinyproxy` parameter)
* Alignment with the Puppet style guide and address puppet-lint warnings

Released under the Apache 2.0 license

Dependencies:
-------------

* puppet-concat: https://forge.puppetlabs.com/puppetlabs/concat
* puppet-stdlib: https://forge.puppetlabs.com/puppetlabs/stdlib

Usage:
------

You can install, configure and start the service simply by including the class
```puppet
include tinyproxy
```

The module supports most of tinyproxy's parameters, check init.pp for more details.
Here's an example on how to override a few parameters:
```puppet
class { 'tinyproxy':
  listen             => '127.0.0.1',
  port               => '8080',
  connection_timeout => '60',
}
```

In addition you can add ACLs, headers and upstream proxies via separate resource definitions:
```puppet
tinyproxy::header { 'X-My-Header':
  value  => 'Powered by Tinyproxy'
}

tinyproxy::upstream { 'my_upstream':
  proxy  => 'myproxy:8080',
  match  => '.domain.com'
}

tinyproxy::noupstream { 'my_noupstream':
  match  => '.internal.domain.com'
}

tinyproxy::reversepath { 'my_reversepath':
  path   => '/mypath/',
  target => 'http://www.some.server.com'
}
```

Contributing
------------
* Fork it
* Create a feature branch
* Make your changes
* Submit a PR
