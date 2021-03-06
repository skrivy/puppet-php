# == Class: php::extension::jsmin
#
# Install the PHP jsmin extension
#
# === Parameters
#
# [*ensure*]
#   The version of the package to install
#   Could be "latest", "installed" or a pinned version
#   This matches "ensure" from Package
#
# [*package*]
#   The package name in your provider
#
# [*provider*]
#   The provider used to install the package
#
# [*inifile*]
#   The path to the extension ini file
#
# [*settings*]
#   Hash with 'set' nested hash of key => value
#   set changes to agues when applied to *inifile*
#
# === Variables
#
# No variables
#
# === Examples
#
#  include 'php::extension::jsmin'
#
#  class {'php::extension::jsmin':
#   ensure => latest
#  }
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
#
# === Copyright
#
# Copyright 2012-2015 Christian "Jippi" Winther, unless otherwise noted.
#
class php::extension::jsmin(
  $ensure   = $php::extension::jsmin::params::ensure,
  $package  = $php::extension::jsmin::params::package,
  $provider = $php::extension::jsmin::params::provider,
  $inifile  = $php::extension::jsmin::params::inifile,
  $settings = $php::extension::jsmin::params::settings
) inherits php::extension::jsmin::params {

  php::extension { 'jsmin':
    ensure   => $ensure,
    package  => $package,
    provider => $provider
  }

  php::config { 'php-extension-jsmin':
    file   => $inifile,
    config => $settings
  }

}
