# Class: puppetagent::service

class puppetagent::service {
    service { 'puppet':
        ensure  => $puppetagent::service_state,
        enable  => $puppetagent::service_enable,
        require => File['puppet.conf']
    }
}
