#!/bin/bash
export PACKER_LOG=1
packer build -on-error=ask -force -var-file=user_vars/centos_8.hcl -var-file=user_vars/packer_creds.json -only="stage01.vsphere-iso.centos8-stage01" -timestamp-ui . 
