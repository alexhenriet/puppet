class user {
  user {'main-user':
    name => $config::user,
    ensure => 'present',
    home => "/home/$config::user",
    shell => '/bin/bash',
    managehome => true,
    password => $config::password,
  }

  file {'ssh-dir':
    path => "/home/$config::user/.ssh",
    ensure => 'directory', owner => $config::user, group => $config::user, mode => 0700,
    require => User['main-user'],
  }

  file {'authorized_keys':
    path => "/home/$config::user/.ssh/authorized_keys",
    ensure => 'file', owner => $config::user, group => $config::user, mode => 0600,
    source => "puppet:///modules/config/$config::user/authorized_keys",
    require => File['ssh-dir'],
  }
}
