#!/bin/bash
BUILD_BRANCH=manual
docker run \
      --pull always \
      --network host \
      -e BUILD_BRANCH=${BUILD_BRANCH} \
      -e VSPHERE_PASSWORD=${vsphere_password} \
      -v ${PWD}/..:/packer \
      nexus.antlinux.local:8443/custom-base/hashicorp/packer:latest \
      build -color=false -timestamp-ui -on-error=cleanup -force \
      -var-file=vars/centos7-7.9.2009.hcl \
      -only="stage01.vsphere-iso.centos_iso" /packer/stage01