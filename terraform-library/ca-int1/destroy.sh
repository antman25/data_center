#!/bin/bash
docker run -v /mnt/scratch/projects/data_center/terraform-library/ca-int1:/terraform nexus.antlinux.local:8443/custom-base/hashicorp/terraform:latest terraform destroy -auto-approve
