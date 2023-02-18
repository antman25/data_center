#!/bin/bash
helm upgrade --install -n consul consul hashicorp/consul --create-namespace -f /mnt/scratch/projects/data_center/k8s-services/consul/test_setup.yaml
