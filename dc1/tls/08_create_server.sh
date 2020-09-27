echo "Creating server key for vault.service.consul"
openssl genrsa \
      -out /root/ca/intermediate/private/vault.service.consul.key.pem 2048
chmod 400 /root/ca/intermediate/private/vault.service.consul.key.pem

echo "Creating server CSR"
openssl req -config ./intermediate_openssl.cnf \
      -key /root/ca/intermediate/private/vault.service.consul.key.pem \
      -new -sha256 -out /root/ca/intermediate/csr/vault.service.consul.csr.pem

echo "Creating server certificate"
openssl ca -config ./intermediate_openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in /root/ca/intermediate/csr/vault.service.consul.csr.pem \
      -out /root/ca/intermediate/certs/vault.service.consul.cert.pem
chmod 444 /root/ca/intermediate/certs/vault.service.consul.cert.pem
