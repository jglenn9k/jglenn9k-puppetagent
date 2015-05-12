# Class: puppetagent::config

class puppetagent::config inherits puppetagent {
    case $::osfamily {
        'windows': {
            file {'puppet.conf':
                path    => 'C:/ProgramData/PuppetLabs/puppet/etc/puppet.conf',
                owner   => 'SYSTEM',
                mode    => '0664',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        'RedHat': {
            file {'puppet.conf':
                path    => '/etc/puppet/puppet.conf',
                owner   => 'root',
                group   => 'root',
                mode    => '0664',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        'Debian': {
            file {'puppet.conf':
                path    => '/etc/puppet/puppet.conf',
                owner   => 'root',
                group   => 'root',
                mode    => '0664',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::osfamily}. Feel free to send a pull request.")
        }
    }
}

