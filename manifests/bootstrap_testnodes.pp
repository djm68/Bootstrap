# Grab user name
$username='root'
$home = $username? {
  'root'  => '/root',
  default => "/home/${username}",
}
include hosts_file
include ifcfg_eth0
include nameserver
include services
include ssh_config
