openssl x509 -noout -text \
      -in /root/ca/intermediate/certs/vault.service.consul.cert.pem
openssl verify -CAfile /root/ca/intermediate/certs/ca-chain.cert.pem \
      /root/ca/intermediate/certs/vault.service.consul.cert.pem
