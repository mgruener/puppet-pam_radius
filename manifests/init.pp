class pam_radius (
  $package = $::pam_radius::params::package,
  $config  = $::pam_radius::params::config,
  $servers = [],
) inherits pam_radius::params {

  package { $package:
    ensure => present,
  }

  file { $config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/pam_radius.erb"),
  }
}
