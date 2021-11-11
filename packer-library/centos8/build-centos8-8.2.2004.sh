#!/bin/bash
export PACKER_LOG=1
packer build -on-error=ask -force \
	-var-file=vars/common_vsphere/default.json \
	-var-file=vars/common_vm/default.json \
	-var-file=vars/stage1_iso/centos8-8.2.2004.json \
	-only="stage01.vsphere-iso.centos8_iso" \
	-timestamp-ui . 
