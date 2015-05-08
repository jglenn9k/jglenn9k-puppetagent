# == Class: puppetagent
#
# Full description of class puppetagent here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
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
#  class { puppetagent:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
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
    $puppetmaster   = 'puppet',
    $service_name   = $::puppet::params::service_name,
    $service_enable = true,
    $service_ensure = 'running',
) puppetagent::params
{



class { '::puppet::service':
    service_name   => $service_name,
    service_enable => $service_enable,
    service_ensure => $service_ensure,
  }

    case $::osfamily {
        'RedHat': {
            package { 'puppet':
                ensure => 'latest',
            }
        }
        'windows': {
            file { 'C:/puppet-3.6.2.msi':
            ensure => present,
            source => 'puppet:///modules/puppet/puppet-3.6.2.msi',
            }
            package { 'Puppet':
                 ensure          => installed,
                 provider        => 'windows',
                 source          => 'C:/puppet-3.6.2.msi',
                 install_options => { 'PUPPET_MASTER_SERVER' => $puppetmaster },
                 require => File['C:/puppet-3.6.2.msi']
            }
        }
        default: {
            fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }
    case $::kernel {
        'Linux': {
            file { '/etc/puppet/puppet.conf':
                ensure  => present,
                content => template('puppet/puppet.conf.erb'),
                owner   => 'puppet',
                group   => 'puppet',
                notify  => Class['puppet::service'],
            }
        }
        'windows': {
            if $kernelmajversion == '5.2' {
                $filepath = 'C:/Documents and Settings/All Users/Application Data/PuppetLabs/puppet'
            }
            else { $filepath = 'C:/ProgramData/PuppetLabs/puppet'
            }

            file { "${filepath}/etc/puppet.conf":
                ensure  => 'file',
                content => template('puppet/puppet.conf.windows.erb'),
                owner   => 'SYSTEM',
                group   => 'Administrators',
                mode    => '0774',
                notify  => Class['puppet::service'],
            }
        }
        default: {
            fail("Module ${module_name} is not supported on ${::kernel}")
        }
    }
}

