# @summary Puppet_master role

class role::puppet_master {

  include ::profile::base
  include ::profile_puppet_master

}
