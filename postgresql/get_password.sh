export POSTGRES_PASSWORD=$(kubectl get secret --namespace default maindb-postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode)
echo "Password is ${POSTGRES_PASSWORD}"
