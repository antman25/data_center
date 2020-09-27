ui = true
disable_mlock = true

storage "raft" {
  path    = "/var/lib/vault"
  node_id = "vault-s1"
}

seal "transit" {
  address            = "https://vault:8200"
  token              = "s.Qf1s5zigZ4OX6akYjQXJC1jY"
  disable_renewal    = "false"

  // Key configuration
  key_name           = "transit_key_name"
  mount_path         = "transit/"
  namespace          = "ns1/"

  // TLS Configuration
  tls_ca_cert        = "/etc/vault/ca_cert.pem"
  tls_client_cert    = "/etc/vault/dc1-client-consul-0.pem"
  tls_client_key     = "/etc/vault/ca_cert.pem"
  tls_server_name    = "vault"
  tls_skip_verify    = "false"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  cluster_address = "10.0.0.142:8201"
  tls_disable = "false"
}

seal "pkcs11" {
}

api_addr = "https://10.0.0.142:8200"
cluster_addr = "https://10.0.0.142:8201"

