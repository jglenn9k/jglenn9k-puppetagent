# Class: puppetagent::service

class puppetagent::service (
    $service_state = true,
    $service_ensure = 'running',
) {
    service { 'puppet':
        ensure  => $service_state,
        enable  => $service_enable,
        require => File['puppet.conf']
    }

    case $::osfamily {
        'windows': {
            file {'puppet.conf':
                path    => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
                owner   => 'SYSTEM',
                mode    => '0664',
                content => template('puppet/puppet.conf.windows.erb'),
                notify  => Service['puppet']
            }
        }
        'RedHat': {
                path    => '/etc/puppet/puppet.conf',
                owner   => 'root',
                group   => 'root'
                mode    => '0664',
                content => template('puppet/puppet.conf.RedHat.erb'),
                notify  => Service['puppet']
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
