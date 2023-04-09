resource "vault_mount" "antlinux_org_v1_ica1_v1" {
	path                      = "antlinux-org/v1/ica1/v1"
	type                      = "pki"
	description               = "PKI engine hosting intermediate CA1 v1 for antlinux.local"
	default_lease_ttl_seconds = local.default_3y_in_sec
	max_lease_ttl_seconds     = local.default_3y_in_sec

}

resource "vault_pki_secret_backend_config_ca" "intermediate" {
	depends_on = [vault_mount.antlinux_org_v1_ica1_v1]

	backend = vault_mount.antlinux_org_v1_ica1_v1.path

	//pem_bundle = file("/etc/int-full-chain.pem")
	pem_bundle = file("/mnt/scratch/certs/ca/intermediate/certs/int-full-chain.pem")
}

resource "vault_pki_secret_backend_config_urls" "ocsp" {
  backend = vault_mount.antlinux_org_v1_ica1_v1.path
  issuing_certificates = [
    "http://vault.vault:8200/v1/pki/ca",
  ]

  crl_distribution_points = [
    "http://vault.vault:8200/v1/pki/ca"
  ]
}
