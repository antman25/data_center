server = true
server_name = "consul.service.consul"
ui = true

log_level = "DEBUG"

primary_datacenter = "BootstrapDC"
client_addr = "0.0.0.0"
bind_addr = "0.0.0.0"
advertise_addr = "10.0.0.50"
data_dir = "/var/lib/consul"
datacenter = "BootstrapDC"

node_name = "MainNode"

disable_host_node_id = true
disable_update_check = true
leave_on_terminate = true

enable_syslog = true
verify_incoming = false
verify_outgoing = false
encrypt_verify_incoming = false
encrypt_verify_outgoing = false
verify_server_hostname = false

enable_central_service_config = true
protocol = 3
raft_protocol = 3
recursors = [
  "8.8.8.8",
  "8.8.4.4",
]

ports = {
  dns = 8600
  http = 8500
  https = 8501
  grpc = 8502
  serf_lan = 8301
  serf_wan = 8302
  server = 8300
}

addresses {
  https = "0.0.0.0"
}

acl {
  enabled = true
  default_policy = "allow"
  enable_token_persistence = true
  enable_key_list_policy = true
}

auto_config {
  enabled = false
}

connect {
  enabled = true
}

auto_encrypt {
  allow_tls = false
}

