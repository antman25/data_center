SERVER_NAME="vault.service.consul"
echo "Creating KEY ${SERVER_NAME}"
openssl genrsa \
      -out /root/ca/intermediate/private/${SERVER_NAME}.key.pem 2048
chmod 400 /root/ca/intermediate/private/${SERVER_NAME}.key.pem

echo "Creating CSR ${SERVER_NAME}"
openssl req -config ./intermediate_openssl.cnf \
      -key /root/ca/intermediate/private/${SERVER_NAME}.key.pem \
      -new -sha256 -out /root/ca/intermediate/csr/${SERVER_NAME}.csr.pem

echo "Creating CERT ${SERVER_NAME}"
openssl ca -config ./intermediate_openssl.cnf \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in /root/ca/intermediate/csr/${SERVER_NAME}.csr.pem \
      -out /root/ca/intermediate/certs/${SERVER_NAME}.cert.pem
chmod 444 /root/ca/intermediate/certs/{$SERVER_NAME}.cert.pem

cp /root/ca/intermediate/certs/{$SERVER_NAME}.cert.pem /etc/certs
chown vault:vault /etc/certs/{$SERVER_NAME}.cert.pem
chmod 444 /etc/certs/{$SERVER_NAME}.cert.pem
