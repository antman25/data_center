ARG UBI_VERSION=ubi8/ubi8:latest
FROM nexus.antlinux.local:8443/custom-base/${UBI_VERSION}

ENV PACKER_VERSION=1.7.8
ENV PACKER_LOG=1

RUN useradd -ms /bin/bash/ packer && \
    yum install -y unzip && \ 
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/packer/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm /tmp/packer_${PACKER_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/packer && \
    ln -s /usr/local/bin/packer /bin/packer && \
    mkdir /packer && \
    chown packer:packer /packer

USER packer:packer
WORKDIR /packer
VOLUME /packer
ENTRYPOINT ["/bin/packer"]



