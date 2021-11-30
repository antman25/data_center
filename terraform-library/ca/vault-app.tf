
resource "vault_pki_secret_backend_role" "vault-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "vault-app-role"
  ttl              = local.default_30d_in_sec
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["vault.antlinux.local"]
  allow_subdomains = true
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "vault-app-cert" {
	depends_on = [vault_pki_secret_backend_role.vault-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.vault-app-role.name

	common_name = "vault.antlinux.local"
}

resource "local_file" "vault-app-key" {
    content  = vault_pki_secret_backend_cert.vault-app-cert.private_key
    filename = "certs/vault-app-key.pem"
}

resource "local_file" "vault-app-cert" {
    content  = vault_pki_secret_backend_cert.vault-app-cert.certificate
    filename = "certs/vault-app-cert.pem"
}



