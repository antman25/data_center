ui = true

storage "raft" {
  path    = "data"
  node_id = "vault-s1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  cluster_address = "10.0.0.142:8201"
  tls_disable = "true"
}

api_addr = "https://10.0.0.142:8200"
cluster_addr = "https://10.0.0.142:8201"

