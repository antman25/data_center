resource "vault_mount" "antlinux_local_v1_ica1_v1" {
	path                      = "antlinux-local/v1/ica1/v1"
	type                      = "pki"
	description               = "PKI engine hosting intermediate CA1 v1 for test org"
	default_lease_ttl_seconds = local.default_1hr_in_sec
	max_lease_ttl_seconds     = local.default_3y_in_sec
}

/*
resource "vault_pki_secret_backend_intermediate_cert_request" "antlinux_local_v1_ica1_v1" {
 depends_on   = [vault_mount.antlinux_local_v1_ica1_v1]
 backend      = vault_mount.antlinux_local_v1_ica1_v1.path
 type         = "internal"
 common_name  = "Intermediate CA1 v1 "
 key_type     = "rsa"
 key_bits     = "2048"
 ou           = "test org"
 organization = "test"
 country      = "US"
 locality     = "Bethesda"
 province     = "MD"
}*/

resource "vault_pki_secret_backend_config_ca" "intermediate" {
  depends_on = [vault_mount.antlinux_local_v1_ica1_v1]

  backend = vault_mount.antlinux_local_v1_ica1_v1.path

  pem_bundle = file("/tmp/int-full-chain.pem")
}
