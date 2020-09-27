openssl ca -config ./root_openssl.cnf -extensions v3_intermediate_ca \
      -days 3650 -notext -md sha256 \
      -in /root/ca/intermediate/csr/intermediate.csr.pem \
      -out /root/ca/intermediate/certs/intermediate.cert.pem
