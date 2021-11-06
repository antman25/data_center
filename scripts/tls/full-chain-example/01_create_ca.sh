#consul tls ca create
echo "+++ Creating /root/ca folder"
mkdir -p /root/ca
mkdir -p /root/ca/certs
mkdir -p /root/ca/crl
mkdir -p /root/ca/newcerts
mkdir -p /root/ca/private
mkdir -p /etc/certs

chmod 700 /root/ca/private
touch index.txt /root/ca/index.txt
echo 1000 > /root/ca/serial

openssl genrsa -aes256 -out /root/ca/private/ca.key.pem 4096
chmod 660 /root/ca/private/ca.key.pem
