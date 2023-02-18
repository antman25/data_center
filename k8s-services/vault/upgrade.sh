#!/bin/bash
helm upgrade --install -n vault vault hashicorp/vault --create-namespace -f /mnt/scratch/projects/data_center/k8s-services/vault/test_setup.yaml
