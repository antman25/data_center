#!/bin/bash
#docker build . --tag nexus-nginx:latest
TIMESTAMP=`date +%Y%m%d-%H%M%S`
REPO=nexus.antlinux.local:8443
TAG=${REPO}/custom-base/nginx/nginx-nexus
cp /mnt/scratch/projects/data_center/terraform-library/ca/certs/nexus-app-cert.pem certs/ && \
cp /mnt/scratch/projects/data_center/terraform-library/ca/certs/nexus-app-key.pem certs/ && \
docker build --tag ${TAG}:${TIMESTAMP} --tag ${TAG}:latest --tag nexus-nginx:latest . 
#docker push ${TAG}:${TIMESTAMP} && \
#docker push ${TAG}:latest

