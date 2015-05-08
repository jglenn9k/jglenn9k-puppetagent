# Class: puppetagent::params

class puppetagent::params {
    case $::osfamily {
        'windows': {
            $download_destination = 'C:\\temp'
            $package_source_location = 'http://downloads.puppetlabs.com/windows/'
            $package_name = 'Puppet (64-bit)'
            $package_source = "puppet-${puppetagent::params::version}-x64.msi"
            
            
            $localconfig = "$vardir/localconfig"
        }
        'RedHat': {

            }
        }
        'Debian': {
            fail("TODO: Add support for ${::osfamily}. Feel free to send a pull request.")
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::osfamily}. Feel free to send a pull request.")
        }
    }

}

