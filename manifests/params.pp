# Class: puppetagent::params

class puppetagent::params (
    $archive_files = true,
    $runinterval = '3600',
    $report = true,
    $reportserver = 'puppet',
    $summarize = true,
    $splay = true,
    $usecacheonfailure = true,
    $pluginsync = true,
    $logdir = '/var/log/puppet',
    $rundir = '/var/run/puppet',
    $ssldir = '$vardir/ssl',
    $classfile = '$vardir/classes.txt',
    $localconfig = '$vardir/localconfig',
    $statedir = '/var/lib/puppet/state',
    $confdir = '/etc/puppet',
    $libdir = '/var/lib/puppet/lib',
    $environment = 'production',
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
