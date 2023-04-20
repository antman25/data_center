resource "vault_policy" "vault-cert-policy" {
  name = "cert-vault-antlinux-local"

  policy = file("vault-cert-policy.policy")
}

resource "vault_kubernetes_auth_backend_role" "cert-manager" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "cert-manager-role"
  bound_service_account_names      = ["issuer"]
  bound_service_account_namespaces = ["cert-manager" ]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.vault-cert-policy.name]
}

