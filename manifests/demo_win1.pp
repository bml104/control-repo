user { 'ajuric':
  ensure => present,
  password => 'Pass!3w0rd',
  groups => 'test2',
  auth_membership => inclusive
}
group { 'demo group':
  name => 'test2',
  ensure => present,
  auth_membership => false,
}
local_security_policy { 'Log on as a service':
  ensure => present,
  policy_value => 'cloudbase-init,NT_SERVICE\ALL_SERVICES,ajuric',
}
