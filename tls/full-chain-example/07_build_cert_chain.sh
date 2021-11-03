#cat /root/ca/certs/ca.cert.pem /root/ca/intermediate/certs/intermediate_ca.cert.pem  > /root/ca/intermediate/certs/ca-chain.cert.pem
cat /root/ca/intermediate/private/intermediate_ca.decrypted-key.pem /root/ca/intermediate/certs/intermediate_ca.cert.pem /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/int-full-chain.pem

#chmod 644 /root/ca/intermediate/certs/ca-chain.cert.pem

#cat  /root/ca/intermediate/private/intermediate_ca.key.pem \
#     /root/ca/intermediate/certs/intermediate_ca.cert.pem \
#      /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/ca-full-chain.cert.pem
#chmod 600 /root/ca/intermediate/certs/ca-full-chain.cert.pem
#sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' /root/ca/intermediate/certs/ca-full-chain.cert.pem

#openssl rsa -in /root/ca/intermediate/private/intermediate_ca.decrypted-key.pem -out /root/ca/intermediate/private/intermediate_ca.pkcs1.key -outform pem
#cat /root/ca/intermediate/private/intermediate_ca.pkcs1.key /root/ca/intermediate/certs/intermediate_ca.cert.pem /root/ca/certs/ca.cert.pem > /root/ca/intermediate/certs/int-full-chain.pem
