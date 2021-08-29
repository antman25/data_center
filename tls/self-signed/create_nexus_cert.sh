openssl req \
  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
  -addext "subjectAltName = DNS:nexus.antlinux.local" \
  -x509 -days 365 -out certs/domain.crt
