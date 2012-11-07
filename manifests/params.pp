# == Class: openvpn::params
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
class openvpn::params {
  $basedir = $::operatingsystem ? {
    default => '/etc/openvpn',
  }

  $group = $::operatingsystem ? {
    default => 'root',
  }

  $defaultfile = $::operatingsystem ? {
    default => '/etc/default/openvpn',
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $mode = $::operatingsystem ? {
    default => '0640',
  }

  $owner = $::operatingsystem ? {
    default => 'root',
  }

  $packagename = $::operatingsystem ? {
    default => 'openvpn',
  }

  $processname = $::operatingsystem ? {
    default => 'openvpn',
  }

  $servicename = $::operatingsystem ? {
    default => 'openvpn',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
