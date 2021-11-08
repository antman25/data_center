ARG UBI_VERSION=ubi8/ubi:8.4-213
FROM nexus.antlinux.local:8443/vendor-base/${UBI_VERSION}
ENV TERRAFORM_VERSION=1.0.10
ENV TERRAFORM_ROOT=/usr/share/terraform
ENV PROVIDER_DIR=${TERRAFORM_ROOT}/providers
ENV HOSTNAME_DIR=${PROVIDER_DIR}/registry.terraform.io
ENV NAMESPACE_DIR=${HOSTNAME_DIR}/hashicorp
ENV VAULT_PROVIDER_DIR=${NAMESPACE_DIR}/vault
ENV VSPHERE_PROVIDER_DIR=${NAMESPACE_DIR}/vsphere
ENV LOCAL_PROVIDER_DIR=${NAMESPACE_DIR}/local
ENV AD_PROVIDER_DIR=${NAMESPACE_DIR}/ad

RUN useradd -ms /bin/bash/ terraform && \
    yum install -y unzip && \ 
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/terraform/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/terraform && \
    mkdir /terraform && \
    chown -R terraform:terraform /terraform

RUN echo ${HOSTNAME_DIR}
RUN echo ${VSPHERE_PROVIDER_DIR}

RUN mkdir -p ${TERRAFORM_ROOT} && \
    mkdir -p ${PROVIDER_DIR} && \
    mkdir -p ${HOSTNAME_DIR} && \
    mkdir -p ${NAMESPACE_DIR} && \
    mkdir -p ${VSPHERE_PROVIDER_DIR} && \
    mkdir -p ${VAULT_PROVIDER_DIR} && \
    mkdir -p ${LOCAL_PROVIDER_DIR} && \
    mkdir -p ${AD_PROVIDER_DIR} && \
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/terraform-providers/terraform-provider-vsphere_2.0.2_linux_amd64.zip -o ${VSPHERE_PROVIDER_DIR}/terraform-provider-vsphere_2.0.2_linux_amd64.zip && \
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/terraform-providers/terraform-provider-vault_2.24.1_linux_amd64.zip -o ${VAULT_PROVIDER_DIR}/terraform-provider-vault_2.24.1_linux_amd64.zip && \
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/terraform-providers/terraform-provider-local_2.1.0_linux_amd64.zip -o ${LOCAL_PROVIDER_DIR}/terraform-provider-local_2.1.0_linux_amd64.zip && \
    curl -k -u packer:packer https://nexus.antlinux.local:8443/repository/generic-vendor/hashicorp/terraform-providers/terraform-provider-ad_0.4.3_linux_amd64.zip -o ${AD_PROVIDER_DIR}/terraform-provider-ad_0.4.3_linux_amd64.zip && \
    chown -R terraform:terraform ${TERRAFORM_ROOT}


COPY resources/.terraformrc /home/terraform/.terraformrc

USER terraform:terraform

VOLUME /terraform

ENV TF_LOG=TRACE

WORKDIR /terraform


