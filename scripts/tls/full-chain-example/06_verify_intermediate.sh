openssl x509 -noout -text \
      -in /root/ca/intermediate/certs/intermediate_ca.cert.pem

openssl verify -CAfile /root/ca/certs/ca.cert.pem \
      /root/ca/intermediate/certs/intermediate_ca.cert.bundle.pem

