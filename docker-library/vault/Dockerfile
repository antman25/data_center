ARG UBI_VERSION=ubi8/ubi8:latest
FROM nexus.antlinux.local:8443/custom-base/${UBI_VERSION}

ENV VAULT_VERSION=1.8.4

RUN useradd -ms /bin/bash/ vault && \
    yum install -y unzip && \ 
    curl https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_amd64.zip -o /tmp/vault_1.12.3_linux_amd64.zip && \
    unzip /tmp/vault_1.12.3_linux_amd64.zip -d /usr/local/bin && \
    rm /tmp/vault_1.12.3_linux_amd64.zip && \
    chmod +x /usr/local/bin/vault && \
    ln -s /usr/local/bin/vault /bin/vault 

USER vault:vault


ENTRYPOINT ["/bin/vault"]




