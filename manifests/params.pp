class pam_radius::params {
  # technically openfire runs on windows and mac too, but for the
  # moment only linux support is implemented in this module
  if $::kernel != 'Linux' {
    fail("${module_name} is only supported on Linux")
  }

  # no debian support at the moment...
  case $::operatingsystem {
    /^Fedora|^RedHat|^CentOS/: {
        $package = 'pam_radius'
        $config = '/etc/pam_radius.conf'
      }
    default: { fail("${module_name} is not supported on ${::operatingsystem}") }
  }
}
