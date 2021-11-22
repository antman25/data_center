#!/bin/bash
cp ${PWD}/../../common/* ${PWD}/../stage02 && \
mkdir -p ${PWD}/../stage02/output && \
chown 777 ${PWD}/../stage02/output && \
docker run \
      --pull always \
      --network host \
      -e BUILD_BRANCH=${BUILD_BRANCH} \
      -e VSPHERE_PASSWORD=${VSPHERE_PASSWORD} \
      -v ${PWD}/../stage02:/packer \
      nexus.antlinux.local:8443/custom-base/hashicorp/packer:latest \
      build -color=false -timestamp-ui -on-error=cleanup -force \
      -var-file=$1 \
      -only="stage02.vsphere-clone.centos8-stage02" .