export CONSUL_HTTP_ADDR="127.0.0.1:8501"
curl --request PUT https://"${CONSUL_HTTP_ADDR}"/v1/acl/bootstrap --key certs/dc1-server-consul-0-key.pem
