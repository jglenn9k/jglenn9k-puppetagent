# == Class: puppetagent
#
# Full description of class puppetagent here.
#
# === Parameters
#
# Document parameters here.
#
# [*server*]
#   Sets the Puppet Master server.
#
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
# Copyright 2017 James Glenn, unless otherwise noted.
#

class puppetagent (
    $service_name = 'puppet',
    $service_enable = true,
    $service_state = 'running',
    $version  = '4.8.1',
    $server   = 'puppet',
    $windows_download_destination = 'C:/temp',
    $windows_package_source_location = 'http://downloads.puppetlabs.com/windows',
    $windows_package_name = 'Puppet (64-bit)',
    $windows_package_source = 'puppet-agent-x64-latest.msi',

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
