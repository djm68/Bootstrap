#!/bin/bash


# Shut off useless services
services() {
  for srv in yum-updatesd cups sendmail bluetooth iptables ip6tables; do 
    chkconfig --level 123456 ${srv} off
  done
}

base_cfg() {
$pkg_cmd install vim
$pkg_cmd install ntp

mv /root/.ssh /root/.sshbak
mkdir /root/.ssh
chmod 700 /root/.ssh

cat > /root/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAmheUCx1OFo4PECzIsxwZUWvfFDDFxs1H6UpMPEy5rVgYTe5PlytTA7tcZHb01nh/m1m9qQISFVG065UB8XceFvbN3NSSDNT/38ZC0Z5ho9PV20NUOecAn9eRvysFcJqxOPpqLybcVFb0mz8npz7tznBOstyVjm0KTztPKcpvfD8GrklDquoIp6DUwFuAbzqle3vG1jnLzqD/8omu1+1gNJttq0FROmITknnTNptuhV3/BKex5BJFS9O8EOXs7iq+VUQIRAsIQOeVXulaSml1ovXPLSoxZAkCEJanhZLGmOFiEmKaMADz6X4PWEWFcVOa7XAGXRqyhOCJcCCARYm+Kw== zach@zbook.puppetlabs.lan
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwx9fYHGPMLJBKjOyAgzer6IU6zyLAWAOEAhsxZejXdZhpOm0pH2VjW1KufY0atgHnQBCv7aMkfGt1BryVGGTKZdUINkX1DxvXYSRmJFgTnrGPsts99mUiTRcGViPSR8x+KdfiwWXsx3rlQoKZ+z3uF/O7/qiqbDzRJA7MkyMT0EhyNTYhlumB8UTJzcCqnkfvE0XAkt8oDVH3hkctqoHWRPyl/NB3QWulboMPwa07IXsPf5KuSe8Q03MmOyTZB5I7Zw70USCOA5+N7+HurqnGSetQyoqjJdcK2rzlBlQrVZv2zRODEhNoE1PX5gHZ0ePNamVdcAWU/+ERw9tOOZaQQ== james@pelin.lovedthanlost.net
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAoSzIjnKAlkzmxk8Y32vikLlc8pt0cWi+zDtwCm2cGrxoTDMuDFcia4lqXkVTN4eczsfmH7gnpaJxNWjUdiEp+6p38z5r4W9EATsyPjWkTVDlSbKUX/gRFCEHIbjBGlDEOSEDI6umVEwff+AqAFdmrxzWjbM5WnsH5YbQ/ymq1/cDzfKUU5+RttDrivSBbv4Gszz/1wMGsyAIsT3QbZJur0LjvrY9/nyj1PoJ02V/RSZ2LiYr/vJB7d+7fn1k5EiOZIz8ubGRIYPFXh50931A0MO3mkVFVDQkHLbsANzcLUHtY7X1t6/GhZ8wqy9Q1YgBAp6s6qC0GJtIDstHMsfNZw== matthewrobinson@mattmac.local
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnU9R6RuXDomfhwsVPq56Y8dvPfb7xUV8Zvr1PKjX54QtGGmpT+Bmxb/v3xMBoIEQSOJ5YgaAj7ks1JSy3u1hyxHJupjhocoDxLEzbC+Zqv1uVu3hGghTAgMbT6/2wGqwel7ZJAiJs1zW8Y2tkshTylW2TOXqNVTYrcsgdTiG7lWwviSWX2TeyzwHtmgi2yioGSa+/dFPRIyuvm+hU39a+dhMc+AuTqrw9kpVLKdA4pyqkeW5remwi+MskutDtGqsW9MkoBG3C+/GyEpw9SnilbCCtK7mb6RUNSKfv1LPpWea9UwfEnSxDINofDHR/sImzhU5itDBrry193jqXyUgLQ== djm@Dominic-Maraglias-MacBook-Pro.local
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuv5cM+Y3aV0gMKHCg1RRbW+de7EE7iA5khEaj0ho4tbSe3EywnZnhKOaTsfRYSDD9tQXCmcl2EgDTfIUtUL0wUTH5m2hGB5s8dRiBgDJet9qRk36qmyEj7QXJFFYFVb34xfvtvsHGEHfmuO/FSVtZgM/vznh0Z0LbqNmtbdXaWNHLIaM+4kEc9LL1dwFSkiSJlWzddVk6BCwzuop/jfcMSoybXzbRI5XI0DywefWiXI3ZswNR2AFy28Zgaw3h79n7pG4CdDw4aUU3QubOE88WS3Qtx5SNaH02uVHXnOuWGsBAXCSR/YWjGH3Gl3EhtD8N51bL8AR7CQq0cOfTz85iw== jhelwig@vfb-9
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAviTMdJn35YqfAHMM7Ez2U9h1zjh26ksU4j3ALAIrTXEbgES2YJJ9/14UtGGnvyxGdVvvpBBdavApezfOlioverB1KbPZmgz/rFL4opXcufZyobRIj8GS2LcAXQAh9zM0zl0/bumo/f8DryoS7HYMXHTbIwaP4VlBwG3tuURF9tfDAtrkJUypNlNWi3/wQgoD5l7zwLahBhPYRt1P3vDznb4izuyc89QyGcidlfkGVUB306ZEPZgUEyZraRPYSj6t15LU3wynTz1kMya7FBOu4/i58/xovecBHTwxiGaoth6DGxfoF+QCxVwr7mcF0shV+XCDRuOODCL/KY4vh2pCZw== nick@puppetlabs.com
ssh-dss AAAAB3NzaC1kc3MAAACBAJSpcNpQMrqshDtxEcmgUVXQRFn/pcPx/IDIXoMqF9qz9xuJH1Wj1FkKrCe8rGNKrvGnKp/ZRBEfdpzr+x97u2Gf3yaat1WkHOUh3mh+moKUp7aXa/nxIlCUHf5nds/LQqZ9Cbh75Hy/oQY1zAA/w/HXggxs1jg8SgQGBfwgpktdAAAAFQD7cV89rgFnoHx6l2KfgxztNNv+aQAAAIAZ0wzMk14xj+0YOZiLJAg+UYU/jo05uVRsZwxOarJmBSwsmiat9LzHZ28BmG9LLPKvIvZi5V+LIrP7RQZ9KKjjXcqk2zUTxRibJHA41y63zUmbrgUc0Y5srJ8fdCAGsHX9prud0BTrMYHwog0hNOx34x4nkTnNup2mM5ontzZ4jAAAAIBJ+XbmJrmvM/O8asDoS5rzrMRsYhGcGp4fKsNVcW5SlVgznpEkb+ngug50rQvGqtfyOKFLizCYeNzBk78uQA2Ktpzs4w52oogzlAniz9NBYRl08kv7VP/twbeIBey9iZTeHQVd9ibhb0LcaSEjz6m7jfoSN22EvTEMYlGxv0HVyQ== rip@devco.net
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUIPnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BYc2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHmlDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0Q== hudson@
EOF

chmod 600 /root/.ssh/*

}

# env config
env_cfg() {

# get rid of silly default aliases
cp -f /root/.bashrc /root/.bashrc_bk
cat > /root/.bashrc <<EOF
# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
EOF

# put IP info onto console at boot time
cat > /root/.ip_info.sh <<EOF
#/bin/sh
sleep 10
echo; echo "My IP information" >> /dev/tty1
/sbin/ifconfig  | grep "inet addr" >> /dev/tty1
EOF

chmod +x /root/.ip_info.sh
cat >> /etc/rc.local <<EOF
/root/.ip_info.sh &
EOF
}


git_cfg() {
  $pkg_cmd install rdoc
  $pkg_cmd install ruby
  $pkg_cmd install git-core
}



###############
#  MAIN
###############

pkg_cmd=`which yum` || pkg_cmd=`which apt-get`
pkg_cmd=$pkg_cmd" -y"


if [ "$1" == "base" ] ; then
 exit 0
fi 

if [ "$1" == "git" ] ; then
 git_cfg
 exit 0
fi 
