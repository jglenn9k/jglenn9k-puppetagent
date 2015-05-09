# Class: puppetagent::params

class puppetagent::params {
    case $::osfamily {
        'windows': {
            $windows_download_destination = 'C:\\temp'
            $windows_package_source_location = 'http://downloads.puppetlabs.com/windows/'
            $windows_package_name = 'Puppet (64-bit)'
            $windows_package_source = "puppet-${puppetagent::params::version}-x64.msi"
            $localconfig = '$vardir/localconfig'
        }
        'RedHat': {
            fail("TODO: Add support for ${::osfamily}. Feel free to send a pull request.")
        }
        'Debian': {
            fail("TODO: Add support for ${::osfamily}. Feel free to send a pull request.")
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::osfamily}. Feel free to send a pull request.")
        }
    }
}
