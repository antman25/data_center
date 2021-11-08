ARG UBI_VERSION=ubi8/ubi:8.4-213
FROM nexus.antlinux.local:8443/vendor-base/${UBI_VERSION}

RUN useradd -ms /bin/bash/ ansible && \
    mkdir /ansible && \
    chown ansible:ansible /ansible

USER ansible:ansible

VOLUME /ansible


WORKDIR /ansible


