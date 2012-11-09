# == Class: openvpn::server
#
# This class manages the OpenVPN server
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'openvpn::server': }
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
class openvpn::server {
  require puppet::client
  require sysctl::client
  include openvpn::params
  include openvpn::server::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
