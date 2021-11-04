#!/bin/bash
docker run -e TF_VAR_vault_token=${VAULT_TOKEN} -v /root/ca/intermediate/certs/int-full-chain.pem:/tmp/int-full-chain.pem -v /mnt/scratch/projects/data_center/terraform-library/ca-int1:/terraform nexus.antlinux.local:8443/custom-base/hashicorp/terraform:latest terraform apply -auto-approve -input=false
