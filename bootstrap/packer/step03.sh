#!/bin/bash
export PACKER_LOG=1
packer build -only="template.vsphere-clone.centos8-template" -timestamp-ui -force .
