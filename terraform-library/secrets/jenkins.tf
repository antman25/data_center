resource "vault_policy" "jenkins-vault-pol" {
  name = "jenkins-svc-pol"

  policy = <<EOT
path "secrets/service/jenkins/admin" {
  capabilities = ["read"]
}
EOT
}
