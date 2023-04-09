resource "vault_policy" "bitbucket-policy" {
  name = "bitbucket"

  policy = file("bitbucket-policy.hcl")
}

resource "vault_kubernetes_auth_backend_role" "bitbucket" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "bitbucket"
  bound_service_account_names      = ["default"]
  bound_service_account_namespaces = ["bitbucket"]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.bitbucket-policy.name]
}

