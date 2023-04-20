
resource "vault_pki_secret_backend_role" "cert-manager-app-role" {
  backend          = vault_mount.antlinux_org_v1_ica1_v1.path
  name             = "cert-manager-app-role"
  ttl              = local.default_30d_in_sec
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 2048
  allowed_domains  = [	"vault.antlinux.org", 
			"vault-agent-injector-svc.vault.svc", 
			"vault-agent-injector-svc.vault", 
			"longhorn.antlinux.org",
			"bitbucket.antlinux.org",
			"jenkins.antlinux.org",
			"localhost", 
			"127.0.0.1"]
  allow_subdomains = false
  allow_bare_domains = true
}




