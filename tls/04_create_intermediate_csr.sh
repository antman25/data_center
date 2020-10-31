echo "Creating intermediate ca folder structure"
mkdir -p /root/ca/intermediate
mkdir -p /root/ca/intermediate/certs
mkdir -p /root/ca/intermediate/crl
mkdir -p /root/ca/intermediate/csr
mkdir -p /root/ca/intermediate/newcerts
mkdir -p /root/ca/intermediate/private
chmod 700 /root/ca/intermediate/private
touch /root/ca/intermediate/index.txt
echo 1000 > /root/ca/intermediate/serial
echo 1000 > /root/ca/intermediate/crlnumber

echo "Creating the intermediate key..."
openssl ecparam -genkey -name secp256k1 -out /root/ca/intermediate/private/intermediate.key.pem
echo "Creating the intermediate cert..."
#openssl req -config ./intermediate_openssl.cnf -new -sha256 \
#      -key /root/ca/intermediate/private/intermediate.key.pem \
#     -out /root/ca/intermediate/csr/intermediate.csr.pem
openssl req -config ./intermediate_openssl.cnf -x509 -new -SHA384 -nodes -key /root/ca/intermediate/private/intermediate.key.pem -days 3650 -out /root/ca/intermediate/private/intermediate.cert.pem
cp /root/ca/intermediate/private/intermediate.key.pem /etc/certs
cp /root/ca/intermediate/private/intermediate.cert.pem /etc/certs

