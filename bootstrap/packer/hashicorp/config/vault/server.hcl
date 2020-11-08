ui = true
disable_mlock = true
log_level = "DEBUG"

storage "consul" {
  address = "127.0.0.1:8500"
  path    = "vault"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  cluster_address = "10.0.0.50:8201"
  tls_disable = "true"
}

api_addr = "https://10.0.0.50:8200"
cluster_addr = "https://10.0.0.50:8201"

