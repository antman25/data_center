#export VAULT_SA_NAME=$(kubectl get sa -n vault vault --output jsonpath="{['metadata']['name']}")
#echo "Service account: $VAULT_SA_NAME"
#export SA_JWT_TOKEN=$(kubectl get secret $VAULT_SA_NAME --output 'go-template={{ .data.token }}'| base64 --decode)
#export SA_CA_CRT=$(kubectl config view --raw --minify --flatten --output 'jsonpath={.clusters[].cluster.certificate-authority-data}' | base64 --decode)

#https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-sidecar
#https://developer.hashicorp.com/vault/docs/auth/kubernetes?ajs_aid=ec0318e1-5184-434f-8c81-8a8a983fd5de&_gl=1*fwx12d*_ga*MTEyODk1NzEwNC4xNjI3NzQzOTkz*_ga_P7S46ZYEKW*MTY3Njg2NzU5OC4xLjAuMTY3Njg2NzYwMi4wLjAuMA..&product_intent=vault

vault secrets enable -path=internal kv-v2
vault kv put internal/database/config username="db-readonly-username" password="db-secret-password"


vault auth enable kubernetes

vault write auth/kubernetes/config \
    kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"

vault policy write internal-app - <<EOF
path "internal/data/database/config" {
  capabilities = ["read"]
}
EOF

vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=internal-app \
    bound_service_account_namespaces=default \
    policies=internal-app \
    ttl=24h

kubectl create sa internal-app
