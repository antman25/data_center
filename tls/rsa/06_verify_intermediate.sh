openssl x509 -noout -text \
      -in /root/ca/intermediate/certs/intermediate.cert.pem

openssl verify -CAfile /root/ca/certs/ca.cert.pem \
      /root/ca/intermediate/certs/intermediate.cert.pem

