# SSH Setup
class ssh_config {
File{ owner => $username, group => $username, mode => 600,}
file{ [$home, "${home}/.ssh"]:
   ensure => directory,
   source  => '/etc/puppet/modules/ssh_config/files',
   recurse => true,
}
}
