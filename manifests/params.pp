# Class: puppetagent::params

class puppetagent::params {
# Settings for [main]
    $pluginsync = true
    $logdir = '/var/log/puppet'
    $rundir = '/var/run/puppet'
    $ssldir = '$vardir/ssl'
    $classfile = '$vardir/classes.txt'
    $localconfig = '$vardir/localconfig'
    $statedir = '/var/lib/puppet/state'
    $confdir = '/etc/puppet'
    $libdir = '/var/lib/puppet/lib'
    $environment = 'production'

# Settings for [agent]
    $archive_files = true
    $runinterval = '3600'
    $report = true
    $reportserver = 'puppet'
    $summarize = true
    $splay = true
    $usecacheonfailure = false
    $factpath = '/var/lib/puppet/lib/facter:/var/lib/puppet/facts:/lib/facter'

# Settings for [master]
    $storeconfigs = true
    $storeconfigs_backend = 'puppetdb'
    $reports = ['http','puppetdb']
    $ssl_client_header = 'SSL_CLIENT_S_DN'
    $ssl_client_verify_header = 'SSL_CLIENT_VERIFY'
    $environmentpath = '$confdir/environments'
    $document_all = false
    $dns_alt_names = ['puppet','puppet.example.lan','puppet.example.com']

}

