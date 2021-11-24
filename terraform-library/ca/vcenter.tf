resource "vault_pki_secret_backend_role" "vcenter-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "vcenter-app-role"
  ttl              = local.default_30d_in_sec
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["vcenter.antlinux.local"]
  allow_subdomains = true
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "vcenter-app-cert" {
	depends_on = [vault_pki_secret_backend_role.vcenter-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.vcenter-app-role.name

	common_name = "vcenter.antlinux.local"
}

resource "local_file" "vcenter-app-key" {
    content  = vault_pki_secret_backend_cert.vcenter-app-cert.private_key
    filename = "certs/vcenter-app-key.pem"
}

resource "local_file" "vcenter-app-cert" {
    content  = vault_pki_secret_backend_cert.vcenter-app-cert.certificate
    filename = "certs/vcenter-app-cert.pem"
}



