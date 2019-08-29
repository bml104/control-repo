class role::loadbalancer (
  Integer   $ports1 = '80',
  Optional[Integer]   $ports2 = undef,
  String    $rule1 = 'http',
  Optional[String]    $rule2 = undef,
  String    $backendserver_name1 = '',
  String    $backendserver_name2 = '',
  Optional[String]   $backendserver_ipaddress1 = undef,
  Optional[String]   $backendserver_ipaddress2 = undef,
  ) {
  include ::haproxy
  haproxy::listen { $rule1 :
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => $ports1,
  }

  haproxy::balancermember { $backendserver_name1 :
    listening_service => 'puppetserver',
    server_names      => $backendserver_name1,
    ipaddress         => $backendserver_ipaddress1,
    ports             => $ports1,
    options           => 'check',
  }

  haproxy::balancermember { $backendserver_name2 :
    listening_service => 'puppetserver',
    server_names      => $backendserver_name2,
    ipaddress         => $backendserver_ipaddress2,
    ports             => $ports1,
    options           => 'check',
  }

}