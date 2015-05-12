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

    $pluginsync = puppetagent::params::pluginsync,
    $logdir = puppetagent::params::logdir,
    $rundir = puppetagent::params::rundir,
    $ssldir = puppetagent::params::ssldir,
    $classfile = puppetagent::params::classfile,
    $localconfig = puppetagent::params::localconfig,
    $statedir = puppetagent::params::statedir,
    $confdir = puppetagent::params::confdir,
    $libdir = puppetagent::params::libdir,
    $environment = puppetagent::params::environment,

# Settings for [agent]
    $archive_files = puppetagent::params::archive_files,
    $runinterval = puppetagent::params::runinterval,
    $report = puppetagent::params::report,
    $reportserver = puppetagent::params::reportserver,
    $summarize = puppetagent::params::summarize,
    $splay = puppetagent::params::splay,
    $usecacheonfailure = puppetagent::params::usecacheonfailure,

# Settings for [master]
    $storeconfigs = puppetagent::params::storeconfigs,
    $storeconfigs_backend = puppetagent::params::storeconfigs_backend,
    $reports = puppetagent::params::reports,
    $ssl_client_header = puppetagent::params::ssl_client_header,
    $ssl_client_verify_header = puppetagent::params::ssl_client_verify_header,
    $environmentpath = puppetagent::params::environmentpath,
    $document_all = puppetagent::params::document_all,
    $dns_alt_names = puppetagent::params::dns_alt_names,
    
) inherits puppetagent::params {

}
