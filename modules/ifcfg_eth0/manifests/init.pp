# Setup ifcfg-eth0 with fixed IP
class ifcfg_eth0 {
case $hostname {
  pmaster: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files',
    }
  }
  qa1: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files',
    }
  }
  mqhq: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files',
    }
  }
}
}
