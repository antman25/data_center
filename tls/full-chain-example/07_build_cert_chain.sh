cat /root/ca/intermediate/certs/intermediate_ca.cert.pem \
      /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/ca-chain.cert.pem
chmod 444 /root/ca/intermediate/certs/ca-chain.cert.pem

cat  /root/ca/intermediate/private/intermediate_ca.key.pem \
     /root/ca/intermediate/certs/intermediate_ca.cert.pem \
      /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/ca-full-chain.cert.pem
chmod 400 /root/ca/intermediate/certs/ca-full-chain.cert.pem
sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' /root/ca/intermediate/certs/ca-full-chain.cert.pem
