#!/bin/bash

#################################################################
# Re-config eth0 from dhcp to fixed IP based on current settings
#################################################################

eth0_cfg() {
  cp -f /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-eth0.bak
  HWADDR=`cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep HWADDR`
  IPADDR=`ifconfig eth0 | grep Bcast |awk -F":" '{print $2}' | awk -F"Bcast" '{print $1}'`

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF
DEVICE=eth0
NETMASK=255.255.255.0
NETWORK=192.168.255.0
BROADCAST=255.255.255.255
GATEWAY=192.168.97.2
ONBOOT=yes
$HWADDR
IPADDR=${IPADDR}
EOF
}


#################################################################
# Create Network File
#################################################################
net_cfg() {

cp /etc/sysconfig/network /etc/sysconfig/network.bak
cat > /etc/sysconfig/network <<EOF
NETWORKING=yes
NETWORKING_IPV6=no
HOSTNAME=${HOST}
EOF

}

packages() {
#  yum -y install puppet
#  yum -y install git 
#  yum -y groupinstall
  yum -y sysstat
}


# Shut off useless services
services() {
  for srv in cups sendmail bluetooth iptables ip6tables; do 
    chkconfig --level 123456 ${srv} off
  done
}

ssh_cfg() {
mv /root/.ssh /root/.sshbak
mkdir /root/.ssh
chmod 700 /root/.ssh

cat > /root/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUIPnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BYc2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHmlDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0Q== root@pmaster
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuv5cM+Y3aV0gMKHCg1RRbW+de7EE7iA5khEaj0ho4tbSe3EywnZnhKOaTsfRYSDD9tQXCmcl2EgDTfIUtUL0wUTH5m2hGB5s8dRiBgDJet9qRk36qmyEj7QXJFFYFVb34xfvtvsHGEHfmuO/FSVtZgM/vznh0Z0LbqNmtbdXaWNHLIaM+4kEc9LL1dwFSkiSJlWzddVk6BCwzuop/jfcMSoybXzbRI5XI0DywefWiXI3ZswNR2AFy28Zgaw3h79n7pG4CdDw4aUU3QubOE88WS3Qtx5SNaH02uVHXnOuWGsBAXCSR/YWjGH3Gl3EhtD8N51bL8AR7CQq0cOfTz85iw== jhelwig@vfb-9
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnU9R6RuXDomfhwsVPq56Y8dvPfb7xUV8Zvr1PKjX54QtGGmpT+Bmxb/v3xMBoIEQSOJ5YgaAj7ks1JSy3u1hyxHJupjhocoDxLEzbC+Zqv1uVu3hGghTAgMbT6/2wGqwel7ZJAiJs1zW8Y2tkshTylW2TOXqNVTYrcsgdTiG7lWwviSWX2TeyzwHtmgi2yioGSa+/dFPRIyuvm+hU39a+dhMc+AuTqrw9kpVLKdA4pyqkeW5remwi+MskutDtGqsW9MkoBG3C+/GyEpw9SnilbCCtK7mb6RUNSKfv1LPpWea9UwfEnSxDINofDHR/sImzhU5itDBrry193jqXyUgLQ== djm@Dominic-Maraglias-MacBook-Pro.local
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5LK9ZOYoUgdRC309ssaw+8MVSXhYPW7k0R6cTekhR9w78vctWuE2vRZbx0xAwO3WyQYY2RuksXlmEJuKXir34LER1dv734rDOyMBe/V/7okMxlGeziPD7QYIYOrdQJm/qh4c3+ZFQPdS7N0FCMgyr6kNpoNsqnUzS8+tsJrlUTBEMaiL81BCjiQ/H+XgMWZk1Z6HOeTLgNfDgI7xprAenMuAERrhdRRgFOdrd24SxL8SMozFb1Xgv0JTWXyJ8fgPsi88RwO9MqvS0/Qrr+1UUZjhXKx4qHIX6RuVuewZqCOV/uo06q3Dhwgn+VaHg+YQ0yrRZXJHlNAP52WK8yPllw== igal@koshevoy.com
EOF

cat > /root/.ssh/id_rsa <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEoAIBAAKCAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh
+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD
9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUI
PnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BY
c2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHm
lDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0QIBIwKCAQAUNIyT4v2BwGOxmg4L
u51QYFjc64MxfSv9G6aCm6271j+fseagYHt2erf2X121EDzarq3r+4DxT6jI+fyw
emqL+lZINX4F4/NCtkExc5lRCH7+SbdPO6H2+Fr1rNA1I5LR4mfK9CkRmQo208xQ
ZhhgD2msVMwiEGSYqNyEYXe3DWaG4QzEE/Ogt0ym6gDUkv0zoX1FhnHLCTHsTdod
QP65l8AH6J+dSM5SRvOr0N7m5pNtYMPQuWG0h/S9s6DBse+1giAyZUi0lMgzM/oQ
c1QRPE4G72tCcpdeNlH65ZKQb030rxfdVam+Lgr+6U4pXFdFu2ioX5M6n/NNctDz
Eyh7AoGBAN/R+S+JhkyXnrYEGFjgVrbwpjQazzEQF21StZbGPDSIV3qUEt9tXrty
ikH8rCCyJr5ej5e8urkD/OT7DNP8TbmV2ohb1QktlxTI2IhlttAgP7MRW/GmO9ex
XImc0U1xqT+O2uwzpJvHWczaG7kHo/4qLhpynZtkJWwnUJ2tfP77AoGBAMo3CqkB
PlLfmDk1Bp9pMbc+Y5EQ/bQsRHJGKw+ZhJBrg+21zw5b3R+RzrnV3lGerbRLog9U
WxCLD7JqqBLqj3PWk/oJWTlGRKgmw9Ib5nr9rEkxpz0A0ENTsIPmhMWHgspQSumP
6mm/rgufyhBGAHyLYYbHPVwbuXTM4lu8NPSjAoGAeYCdNxAkVXbhIPropUaVeUDP
QNtaiFkxSfmzCLTBmNxMvuKrKNT46WoQiji1NlIVCEH2LczaZG/hDpbptOgM77e/
xl28ynfVrDKELMmAf5x6WeTaJBhpoPnhxwv8l8Fb4Kyiurzy9XrY+i1CP9+Tifmj
/7qQEobSfIpe9oLAMqUCgYAz/4Zl+QFlxHeZroyspgV4Qz4snfgYYyeLGVuHqyIW
ggv7TAILAa3ji+SzcYJPgJMRGsNFxTv88I8B/is4EG4H2BdsLkokq6tBLoogFc2N
VyxNVeks8ZSjmS1jvu7w9vW+/rQtbiZVtPI9gNwwEgAgBpVrzNVDkhm+8tse50DR
MQKBgGBytk1EUEbozMndyARhazKqNoWAMYwqDgOF+WQM284L5TRLSoQNQnfHTs1p
o21mel3SmmVbablmb6SOf0/7DTEqmk6ZbVATQ1sxou7HLlImzcY82yAyoN9Lk2LX
/ZApenvy4FL4z7WkHP9Doby8TSRlvdinzNgNvEgtR1pq3CCr
-----END RSA PRIVATE KEY-----
EOF

cat > /root/.ssh/id_rsa.pub <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUIPnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BYc2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHmlDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0Q== root@pmaster
EOF

chmod 600 /root/.ssh/*

}

# env config
env_cfg() {
cat > /root/.bashrc <<EOF
# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
EOF
}


###############
#  MAIN
###############
# Called with a host name or not?
if [ -z $1 ]; then
  HOST=`hostname -s`
  echo "Using ${HOST} as hostname"
else
  HOST=$1
  echo "Using ${HOST} as hostname"
fi


# eth0_cfg
net_cfg

ssh_cfg
env_cfg
services
