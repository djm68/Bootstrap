# Put correct resolve.conf into place
class nameserver {
file{
  "/etc/resolv.conf":
  ensure  => present,
  source  => '/etc/puppet/modules/nameserver/files/resolv.conf.vmware',
}
}
