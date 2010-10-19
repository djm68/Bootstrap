# Add entries Hosts file
class hosts_file {
host{'pmaster.puppetlabs.lan':
  ensure        => 'present',
  host_aliases  => 'pmaster',
  ip            => '192.168.97.128',
}
host{'mqhq.puppetlabs.lan':
  ensure        => 'present',
  host_aliases  => 'mqhq',
  ip            => '192.168.97.130',
}
host{'qa1.puppetlabs.lan':
  ensure        => 'present',
  host_aliases  => 'qa1',
  ip            => '192.168.56.103',
}
host{'pagent.puppetlabs.lan':
  ensure        => 'present',
  host_aliases  => 'pagent',
  ip            => '192.168.97.129',
}
}
