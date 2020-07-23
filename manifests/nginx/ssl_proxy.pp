define stackhead::nginx::ssl_proxy (
  $proxy_port,
  $listen_port = 80,
) {
  include nginx

  nginx::resource::server { "${name}":
    ensure                => present,
    ssl                   => true,
    ssl_cert => false,
    ssl_key => false,
    ssl_redirect => true,
    proxy           => "http://127.0.0.1:${proxy_port}",
    #ssl_cert              => '/path/to/wildcard_mydomain.crt',
    #ssl_key               => '/path/to/wildcard_mydomain.key',
  }
}