kubectl create serviceaccount -n vault issuer
kubectl apply -f issuer-secret.yaml -n vault
ISSUER_SECRET_REF=$(kubectl get secrets -n vault --output=json | jq -r '.items[].metadata | select(.name|startswith("issuer-token-")).name')
cat > vault-issuer.yaml <<EOF
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: vault-issuer
  namespace: vault
spec:
  vault:
    server: http://vault.vault
    path: antlinux-local/v1/ica1/v1/sign/vault-app-role
    auth:
      kubernetes:
        mountPath: /v1/auth/kubernetes
        role: cert-manager-role
        secretRef:
          name: $ISSUER_SECRET_REF
          key: token
EOF
kubectl apply -f vault-issuer.yaml -n vault
