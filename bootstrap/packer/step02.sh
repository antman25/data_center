#!/bin/bash
export PACKER_LOG=1
packer build -force -var-file=user_vars/centos_8.hcl -only="stage02.vsphere-clone.centos8-stage02" -timestamp-ui .
