ARG UBI_VERSION=ubi8/ubi8:latest
FROM nexus.antlinux.local:8443/custom-base/${UBI_VERSION}

RUN useradd -ms /bin/bash/ ansible && \
    mkdir /ansible && \
    chown ansible:ansible /ansible

USER ansible:ansible

VOLUME /ansible


WORKDIR /ansible


