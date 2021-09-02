openssl ca -config ./root_openssl.cnf -extensions v3_intermediate_ca \
      -days 3650 -notext -md sha256 \
      -in /root/ca/intermediate/csr/intermediate_ca.csr.pem \
      -out /root/ca/intermediate/certs/intermediate_ca.cert.pem

cat /root/ca/certs/ca.cert.pem /root/ca/intermediate/certs/intermediate_ca.cert.pem > /root/ca/intermediate/certs/intermediate_ca.cert.bundle.pem
