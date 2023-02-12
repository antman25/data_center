#!/bin/bash
docker run -v /mnt/scratch/projects/data_center/terraform-library/secrets:/terraform nexus.antlinux.local:8443/custom-base/hashicorp/terraform:latest init
