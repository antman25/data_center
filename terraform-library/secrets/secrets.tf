resource "vault_mount" "secrets" {
  path        = "secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}


resource "vault_kv_secret_v2" "bitbucket-postres" {
  mount                      = vault_mount.secrets.path
  name                       = "passwords/bitbucket/postgres"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    username       = "atlbitbucket",
    password       = "password"
  }
  )
  custom_metadata {
    max_versions = 5
    data = {
      foo = "vault@example.com",
      bar = "12345"
    }
  }
}


resource "vault_kv_secret_v2" "jenkins-adm" {
  mount                      = vault_mount.secrets.path
  name                       = "service/jenkins/admin"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    username       = "admin",
    password       = "password"
  }
  )
  custom_metadata {
    max_versions = 5
    data = {
      foo = "vault@example.com",
      bar = "12345"
    }
  }
}

resource "vault_kv_secret_v2" "groupa-bitbucket" {
  mount                      = vault_mount.secrets.path
  name                       = "groupa/bitbucket"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    username       = "groupa",
    password       = "password"
  }
  )
}

resource "vault_kv_secret_v2" "groupa-jenkins" {
  mount                      = vault_mount.secrets.path
  name                       = "groupa/nexus"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    username       = "groupa",
    password       = "password"
  }
  )
}
