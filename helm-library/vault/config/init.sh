#!/bin/bash
helm upgrade --namespace vault vault hashicorp/vault -f /mnt/scratch/projects/data_center/helm/vault/config/init.yaml --install
