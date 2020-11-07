#!/bin/bash
export PACKER_LOG=1
packer build -only="install_os.vsphere-iso.centos8-iso" -timestamp-ui -force .
