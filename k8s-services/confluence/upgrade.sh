#!/bin/bash
helm upgrade --install -n confluence confluence atlassian-data-center/confluence -f /mnt/scratch/projects/data_center/k8s-services/confluence/test_setup.yaml
