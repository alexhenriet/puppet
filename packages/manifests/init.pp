class packages {
  package {'common-packages':
    name => ['wget'],
    ensure => 'present'
  }

  package {'epel-packages':
    name => ['htop'],
    ensure => 'present',
    require => Yumrepo['epel']
  }
}
