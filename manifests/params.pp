# Class: puppetagent::params

class puppetagent::params (
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
    $usecacheonfailure = true

# Settings for [master]
    $storeconfigs = true
    $storeconfigs_backend = 'puppetdb'
    $reports = ['http','puppetdb']
    $ssl_client_header = 'SSL_CLIENT_S_DN'
    $ssl_client_verify_header = 'SSL_CLIENT_VERIFY'
    $environmentpath = '$confdir/environments'
    $document_all = true
    $dns_alt_names = ['puppet','puppet.example.lan','puppet.example.com']
)
{
    case $::osfamily {
        'windows': {
            $windows_download_destination = 'C:\\temp'
            $windows_package_source_location = 'http://downloads.puppetlabs.com/windows/'
            $windows_package_name = 'Puppet (64-bit)'
            $windows_package_source = "puppet-${puppetagent::version}-x64.msi"
            $localconfig = '$vardir/localconfig'
        }
        'RedHat': {
            $logdir = '/var/log/puppet'
            $rundir = '/var/run/puppet'
            $ssldir = '$vardir/ssl'
            $classfile = '$vardir/classes.txt'
            $localconfig = '$vardir/localconfig'
        }
        'Debian': {
            fail("TODO: Add support for ${::osfamily}. Feel free to send a pull request.")
        }
        default: {
            fail("Module ${module_name} is not currently supported on ${::osfamily}. Feel free to send a pull request.")
        }
    }
}
