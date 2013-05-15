class repos {
  file { 'EPEL-GPG-KEY': 
    path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
    owner => root, 
    group => root, 
    mode => 0444,
    source => 'puppet:///modules/repos/RPM-GPG-KEY-EPEL-6',
  }
  yumrepo { 'epel':
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
    enabled => 1,
    gpgcheck => 1,
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
    require => File['EPEL-GPG-KEY']
  }
}
