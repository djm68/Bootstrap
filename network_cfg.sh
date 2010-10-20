#!/bin/bash

# Re-config eth0 from dhcp to fixed IP based on current settings
eth0_cfg() {
  cp -f /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0.bak
  HWADDR=`cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep HWADDR`
  IPADDR=`ifconfig eth0 | grep Bcast |awk -F":" '{print $2}' | awk -F"Bcast" '{print $1}'`

cat > eth0.out <<EOF
DEVICE=eth0
NETMASK=255.255.255.0
NETWORK=192.168.255.0
BROADCAST=255.255.255.255
GATEWAY=192.168.97.2
ONBOOT=yes
$HWADDR
IPADDR=${IPADDR}
EOF
 # cp -f eth0.out /etc/sysconfig/network-scripts/ifcfg-eth0
}

# Write network file
net_cfg() {
  cp /etc/sysconfig/network /etc/sysconfig/network.bak

cat > net.out <<EOF
NETWORKING=yes
NETWORKING_IPV6=no
HOSTNAME={$HOST}
EOF

  # cp -f net.out /etc/sysconfig/network
}

eth0_cfg
net_cfg
