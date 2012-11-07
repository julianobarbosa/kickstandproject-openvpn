# == Class: openvpn::server::init
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
class openvpn::server::init {
  include openvpn::server::install
  include openvpn::server::config
  include openvpn::server::service

  File {
    group => $openvpn::params::group,
    mode  => $openvpn::params::mode,
    owner => $openvpn::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
