resource "vault_pki_secret_backend_role" "nfs-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "nfs-app-role"
  ttl              = local.default_30d_in_sec
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["nfs.antlinux.local"]
  allow_subdomains = true
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "nfs-app-cert" {
	depends_on = [vault_pki_secret_backend_role.nfs-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.nfs-app-role.name

	common_name = "nfs.antlinux.local"
}

resource "local_file" "nfs-app-key" {
    content  = vault_pki_secret_backend_cert.nfs-app-cert.private_key
    filename = "certs/nfs-app-key.pem"
}

resource "local_file" "nfs-app-cert" {
    content  = vault_pki_secret_backend_cert.nfs-app-cert.certificate
    filename = "certs/nfs-app-cert.pem"
}



