# Setup ifcfg-eth0 with fixed IP
class ifcfg_eth0 {

case $hostname {
  pmaster: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files/ifcfg-eth0.pmaster',
    }
  }
  pmaster: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files/ifcfg-eth0.pagent',
    }
  }
  qa1: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files/ifcfg-eth0.qa1',
    }
  }
  mqhq: { 
    file{
      "/etc/sysconfig/network-scripts/ifcfg-eth0":
      ensure  => present,
      source  => '/etc/puppet/modules/ifcfg_eth0/files/ifcfg-eth0.mqhq',
    }
  }
}

}
