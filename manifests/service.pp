# Class: puppetagent::service

class puppetagent::service inherits puppetagent {
    service { "$puppetagent::service_name":
        ensure  => $puppetagent::service_state,
        enable  => $puppetagent::service_enable,
        require => File['puppet.conf']
    }
}
