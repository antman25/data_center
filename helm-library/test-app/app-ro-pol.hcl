# As we are working with KV v2
path "kv/data/secret/app/*" {
    capabilities = ["read", "list"]
}
