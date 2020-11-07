#!/bin/bash
export PACKER_LOG=1
packer build -only="stage01.vsphere-iso.centos8-stage01" -timestamp-ui -force .
