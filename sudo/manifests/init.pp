class sudo {

  $user = $config::user

  package {'sudo':
    ensure => 'present'
  }

  file {'/etc/sudoers':
    ensure => 'file',
    owner => 'root',
    group => 'root',
    mode => 0440,
    content => template('sudo/sudoers.erb'),
    require => Package['sudo']
  }
}
