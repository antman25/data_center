
resource "vault_pki_secret_backend_role" "nexus-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "nexus-app-role"
  ttl              = 3600
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["nexus.antlinux.local"]
  allow_subdomains = true
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "nexus-app-cert" {
	depends_on = [vault_pki_secret_backend_role.nexus-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.nexus-app-role.name

	common_name = "nexus.antlinux.local"
}

resource "local_file" "nexus-app-key" {
    content  = vault_pki_secret_backend_cert.nexus-app-cert.private_key
    filename = "certs/nexus-app-key.pem"
}

resource "local_file" "nexus-app-cert" {
    content  = vault_pki_secret_backend_cert.nexus-app-cert.certificate
    filename = "certs/nexus-app-cert.pem"
}



