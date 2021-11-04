ARG UBI_VERSION=ubi8/ubi:8.4-213
FROM nexus.antlinux.local:8443/vendor-base/${UBI_VERSION}

ENV VAULT_VERSION=1.8.4

RUN useradd -ms /bin/bash/ vault && \
    yum install -y unzip && \ 
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/vault/vault_${VAULT_VERSION}_linux_amd64.zip -o /tmp/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm /tmp/vault_${VAULT_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/vault 

USER vault:vault

WORKDIR /home/vault


