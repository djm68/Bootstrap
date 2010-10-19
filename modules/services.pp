# Disable unneeded services
class services {
service {'iptables':
  enable     => false,
  ensure     => stopped,
  hasstatus  => true,
} 
service {'ip6tables':
  enable     => false,
  ensure     => stopped,
  hasstatus  => true,
}
}
