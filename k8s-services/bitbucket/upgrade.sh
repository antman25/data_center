#!/bin/bash
helm upgrade --install -n bitbucket bitbucket atlassian-data-center/bitbucket --create-namespace --version 1.9.1 -f /mnt/scratch/projects/data_center/k8s-services/bitbucket/test_setup.yaml
