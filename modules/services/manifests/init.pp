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
service {'cups':
  enable     => false,
  ensure     => stopped,
  hasstatus  => true,
}
service {'sendmail':
  enable     => false,
  ensure     => stopped,
  hasstatus  => true,
}
service {'bluetooth':
  enable     => false,
  ensure     => stopped,
  hasstatus  => true,
}

}
