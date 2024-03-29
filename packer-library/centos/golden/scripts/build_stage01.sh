#!/bin/bash
cp ${PWD}/../../common/* ${PWD}/../stage01 && \
docker run \
      --pull always \
      --network host \
      -e BUILD_BRANCH=${BUILD_BRANCH} \
      -e VSPHERE_PASSWORD=${VSPHERE_PASSWORD} \
      -v ${PWD}/../stage01:/packer \
      nexus.antlinux.local:8443/custom-base/hashicorp/packer:latest \
      build -color=false -timestamp-ui -on-error=cleanup -force \
      -var-file=$1 \
      -only="stage01.vsphere-iso.centos_iso" .