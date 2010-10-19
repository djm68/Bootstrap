# Put correct resolve.conf into place
class nameserver {
file{
  "/etc/resolv.conf":
  ensure  => present,
  source  => '/etc/puppet/files/resolv.conf.vmware',
}
}
