# /etc/puppet/manifests/apache.pp

class apache {
  file { "/etc/httpd/conf.d/myconfig.conf":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/apache/myconfig.conf",
    notify => Service['httpd'],
  }

  service { 'httpd':
    ensure => running,
    enable => true,
    require => File["/etc/httpd/conf.d/myconfig.conf"],
  }
}

include apache

