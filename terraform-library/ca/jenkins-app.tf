
resource "vault_pki_secret_backend_role" "jenkins-app-role" {
  backend          = vault_mount.antlinux_local_v1_ica1_v1.path
  name             = "jenkins-app-role"
  ttl              = 3600
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["jenkins.antlinux.local"]
  allow_subdomains = true
  allow_bare_domains = true
}

resource "vault_pki_secret_backend_cert" "jenkins-app-cert" {
	depends_on = [vault_pki_secret_backend_role.jenkins-app-role]

	backend = vault_mount.antlinux_local_v1_ica1_v1.path
	name = vault_pki_secret_backend_role.jenkins-app-role.name

	common_name = "jenkins.antlinux.local"
}

resource "local_file" "jenkins-app-key" {
    content  = vault_pki_secret_backend_cert.jenkins-app-cert.private_key
    filename = "certs/jenkins-app-key.pem"
}

resource "local_file" "jenkins-app-cert" {
    content  = vault_pki_secret_backend_cert.jenkins-app-cert.certificate
    filename = "certs/jenkins-app-cert.pem"
}



