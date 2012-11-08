# == Define: openvpn::function::tunnel::server
#
# === Parameters
#
# === Variables
#
# === Examples
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
define openvpn::function::tunnel::server(
  $server,
  $port = '1194',
  $proto = 'udp',
  $dev = 'tun',
  $cert = "${name}.crt",
  $key = "${name}.key",
  $dh = '2048',
  $keepalive = '10 120',
  $tls-auth = 'ta.key',
  $cipher = 'BF-CBC',
  $compression = true,
) {
  file { "${openvpn::params::basedir}/${name}.conf":
    ensure  => file,
    content => template('openvpn/server/etc/openvpn/server.conf.erb'),
    notify  => Class['openvpn::server::service'],
    require => File[$openvpn::params::basedir],
  }

  file { "${openvpn::params::basedir}/${name}.conf.d":
    ensure  => directory,
    notify  => Class['openvpn::server::service'],
    require => File[$openvpn::params::basedir],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
