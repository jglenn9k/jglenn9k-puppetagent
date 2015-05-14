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
    $service_state = 'running',
    $version  = '3.7.5',
    $server   = 'puppet',
    $windows_download_destination = 'C:/temp',
    $windows_package_source_location = 'http://downloads.puppetlabs.com/windows',
    $windows_package_name = 'Puppet (64-bit)',
    $windows_package_source = "puppet-3.7.5-x64.msi",

# Settings for [main]
    $pluginsync = true,
    $logdir = '/var/log/puppet',
    $rundir = '/var/run/puppet',
    $ssldir = '$vardir/ssl',
    $classfile = '$vardir/classes.txt',
    $localconfig = '$vardir/localconfig',
    $statedir = '/var/lib/puppet/state',
    $confdir = '/etc/puppet',
    $libdir = '/var/lib/puppet/lib',
    $environment = 'production',
    $configtimeout = '120',

# Settings for [agent]
    $archive_files = true,
    $runinterval = '3600',
    $report = true,
    $reportserver = 'puppet',
    $summarize = true,
    $splay = true,
    $usecacheonfailure = false,
    $factpath = '/var/lib/puppet/lib/facter:/var/lib/puppet/facts:/lib/facter',

# Settings for [master]
    $storeconfigs = true,
    $storeconfigs_backend = 'puppetdb',
    $reports = ['http','puppetdb'],
    $ssl_client_header = 'SSL_CLIENT_S_DN',
    $ssl_client_verify_header = 'SSL_CLIENT_VERIFY',
    $environmentpath = '$confdir/environments',
    $document_all = false,
    $dns_alt_names = ['puppet','puppet.example.lan','puppet.example.com'],

) {
    validate_array($dns_alt_names)
    validate_array($reports)

    include 'puppetagent::config'
    include 'puppetagent::install'
    include 'puppetagent::service'

}
