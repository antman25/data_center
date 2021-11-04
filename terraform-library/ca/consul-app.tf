
resource "vault_pki_secret_backend_role" "consul-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "consul-app-role"
  ttl              = 3600
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["consul.antlinux.local"]
  allow_subdomains = false
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "consul-app-cert" {
	depends_on = [vault_pki_secret_backend_role.consul-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.consul-app-role.name

	common_name = "consul.antlinux.local"
}

resource "local_file" "consul-app-key" {
    content  = vault_pki_secret_backend_cert.consul-app-cert.private_key
    filename = "certs/consul-app-key.pem"
}

resource "local_file" "consul-app-cert" {
    content  = vault_pki_secret_backend_cert.consul-app-cert.certificate
    filename = "certs/consul-app-cert.pem"
}



