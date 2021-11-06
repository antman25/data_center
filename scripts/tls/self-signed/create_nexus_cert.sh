openssl req \
  -newkey rsa:4096 -nodes -sha256 -keyout certs/nexus.antlinux.local.key \
  -addext "subjectAltName = DNS:nexus.antlinux.local" \
  -x509 -days 365 -out certs/nexus.antlinux.local.crt
