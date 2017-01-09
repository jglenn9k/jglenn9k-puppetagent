# Class: puppetagent::config

class puppetagent::config inherits puppetagent {
    case $::operatingsystem {
        'windows': {
            file {'puppet.conf':
                path    => "${puppetagent::confdir}/puppet.conf",
                owner   => 'SYSTEM',
                mode    => '0664',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        'CentOS': {
            file {'puppet.conf':
                path    => "${puppetagent::confdir}/puppet.conf",
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        'RedHat': {
            file {'puppet.conf':
                path    => "${puppetagent::confdir}/puppet.conf",
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
        }
        'Ubuntu': {
            file {'puppet.conf':
                path    => "${puppetagent::confdir}/puppet.conf",
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
            file {'/etc/default/puppet':
                path    => '/etc/default/puppet',
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/etc/default/puppet.erb'),
                notify  => Service['puppet']
            }
        'Debian': {
            file {'puppet.conf':
                path    => "${puppetagent::confdir}/puppet.conf",
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/puppet.conf.erb'),
                notify  => Service['puppet']
            }
            file {'/etc/default/puppet':
                path    => '/etc/default/puppet',
                owner   => 'root',
                group   => 'root',
                mode    => '0644',
                content => template('puppetagent/etc/default/puppet.erb'),
                notify  => Service['puppet']
            }
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::operatingsystem}. Feel free to send a pull request.")
        }
    }
}

