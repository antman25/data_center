#!/bin/bash
export PACKER_LOG=1
packer build -only="stage02.vsphere-clone.centos8-stage02" -timestamp-ui -force .
