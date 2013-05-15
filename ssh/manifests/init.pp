class ssh {
  $user = $config::user
  package {'openssh-server':
    ensure => "present"
  }
  file {'/etc/ssh/sshd_config':
    owner => 'root',
    group => 'root',
    mode => 0600,
    content => template('ssh/sshd_config.erb'),
    require => [ Package['openssh-server'], Class['user'], Class['sudo'] ],
    notify => Service['sshd']
  }
  service {'sshd':
    ensure => 'running',
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Package['openssh-server']
  }
}
