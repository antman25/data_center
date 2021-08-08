#!/bin/bash
export PACKER_LOG=1
packer build -only="stage03.vsphere-clone.centos8-stage03" -timestamp-ui -force .
