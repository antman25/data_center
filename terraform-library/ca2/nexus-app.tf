
resource "vault_pki_secret_backend_role" "nexus-app-role" {
  backend          = vault_mount.antlinux_org_v1_ica1_v1.path
  name             = "nexus-app-role"
  ttl              = local.default_30d_in_sec
  allow_ip_sans    = false
  key_type         = "rsa"
  key_bits         = 2048
  allowed_domains  = ["nexus.antlinux.org", "nexus.antlinux.local", "127.0.0.1", "localhost", "nexus.nexus", "nexus", "docker.antlinux.org", "docker.antlinux.local" ]
  allow_subdomains = false
  allow_bare_domains = true
}




