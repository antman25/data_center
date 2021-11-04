ARG UBI_VERSION=ubi8/ubi:8.4-213
FROM nexus.antlinux.local:8443/vendor-base/${UBI_VERSION}

ENV CONSUL_VERSION=1.10.3

RUN useradd -ms /bin/bash/ consul && \
    yum install -y unzip && \ 
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/consul/consul_${CONSUL_VERSION}_linux_amd64.zip -o /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm /tmp/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/consul 

USER consul:consul

WORKDIR /home/consul


