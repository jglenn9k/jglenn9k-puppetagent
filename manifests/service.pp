# Class: puppetagent::service

class puppetagent::service {
    service { 'puppet':
        ensure  => $service_state,
        enable  => $service_enable,
        require => File['puppet.conf']
    }
}
