# == Class: openvpn::server::config
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the Apache License, Version 2.0. See the LICENSE file at
# the top of the source tree.
#
class openvpn::server::config {
  file { $openvpn::params::basedir:
    ensure  => directory,
    require => Class['openvpn::server::install'],
  }

  file { "${openvpn::params::basedir}/dh2048.pem":
    ensure  => file,
    mode    => '0600',
    require => File[$openvpn::params::basedir],
  }

  exec { "${openvpn::params::basedir}/dh2048.pem":
    cwd     => $openvpn::params::basedir,
    command => 'openssl dhparams -out dh2048.pem 2048',
    creates => "${openvpn::params::basedir}/dh2048.pem",
    require => File[$openvpn::params::basedir],
  }

  file { $openvpn::params::varlogdir:
    ensure  => directory,
    require => Class['openvpn::server::install'],
  }

  file { $openvpn::params::defaultfile:
    ensure  => file,
    content => template('openvpn/server/etc/default/openvpn.erb'),
    notify  => Class['openvpn::server::service'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
