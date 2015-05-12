# == Class: puppetagent::install
#
# This private class is meant to be called from `nsclient`.
# It downloads the package and installs it.
#
class puppetagent::install inherits puppetagent {
    validate_string($puppetagent::params::windows_package_source_location)
    validate_string($puppetagent::params::windows_package_source)
    validate_string($puppetagent::params::windows_package_name)

    $source = "${puppetagent::params::windows_package_source_location}/${puppetagent::params::windows_package_source}"

    case $::osfamily {
        'windows': {
            if ! defined(File[$puppetagent::params::windows_download_destination]) {
                file { $puppetagent::params::windows_download_destination:
                    ensure => directory,
                }
            }
            download_file { 'Puppet Agent Installer':
                url                   => $source,
                destination_directory => $puppetagent::params::windows_download_destination,
                require               => File[$puppetagent::params::windows_download_destination]
            }
            package { 'Puppet (x64)':
                ensure   => "$puppetagent::version",
                source   => "${puppetagent::params::windows_download_destination}\\${puppetagent::params::windows_package_source}",
                provider => 'windows',
                require  => Download_file['Puppet Agent Installer']
            }
        }
        'RedHat': {
            yumrepo { 'puppetlabs-products':
                ensure   => 'present',
                baseurl  => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
                descr    => "Puppet Labs Products El ${::operatingsystemmajrelease} - $basearch",
                enabled  => '1',
                gpgcheck => '1',
                gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
            }
            yumrepo { 'puppetlabs-deps':
                ensure   => 'present',
                baseurl  => 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
                descr    => "Puppet Labs Dependencies El ${::operatingsystemmajrelease} - $basearch",
                enabled  => '1',
                gpgcheck => '1',
                gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
            }
            package { 'puppet':
                ensure  => "${puppetagent::version}-1.el${::operatingsystemmajrelease}",
                require => Yumrepo['puppetlabs-products'],
            }
        }
        'Debian': {
            apt::source { 'puppetlabs':
                location => 'http://apt.puppetlabs.com',
                repos    => 'main',
                key      => {
                    'id'     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
                    'server' => 'pgp.mit.edu',
                },
            }
            package { 'puppet':
                ensure  => "${puppetagent::version}-1puppetlabs1",
                require => Apt::Source['puppetlabs']
            }
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::osfamily}. Feel free to send a pull request.")
        }
    }
}

