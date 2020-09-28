cat /root/ca/intermediate/certs/intermediate.cert.pem \
      /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/ca-chain.cert.pem
chmod 444 /root/ca/intermediate/certs/ca-chain.cert.pem
