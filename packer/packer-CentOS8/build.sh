#!/bin/bash
export PACKER_LOG=1
packer build -var-file=variables.json centos8.json
