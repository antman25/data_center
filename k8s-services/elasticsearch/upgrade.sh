#!/bin/bash
helm upgrade --install -n elasticsearch elasticsearch elastic/elasticsearch --create-namespace -f /mnt/scratch/projects/data_center/k8s-services/elasticsearch/test_setup.yaml
