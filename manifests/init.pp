# == Class: puppetagent
#
# Full description of class puppetagent here.
#
# === Parameters
#
# Document parameters here.
#
# [*server*]
#   Sets the Puppet Master server
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
# class { 'puppetagent':
#     server => 'puppetmaster.example.net',
# }
#
# === Authors
#
# James Glenn <thedonkdonk@gmail.com>
#
# === Copyright
#
# Copyright 2015 James Glenn, unless otherwise noted.
#
class puppetagent (
    $service_enable = true,
    $service_ensure = 'running',
    $version  = '3.7.5',

    $server   = 'puppet',

    $archive_files = true,
    $runinterval = '3600',
    $report = true,
    $reportserver = 'puppet',
    $summarize = true,
    $splay = true,
    $usecacheonfailure = true,
    $pluginsync = true,
    $logdir = '/var/log/puppet',
    $rundir = '/var/run/puppet',
    $ssldir = '$vardir/ssl',
    $classfile = '$vardir/classes.txt',
    $localconfig = '$vardir/localconfig',

) puppetagent::params
{

}

