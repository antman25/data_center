#!/bin/bash
helm install -n database postgresql bitnami/postgresql --create-namespace --version 12.2.0 -f /mnt/scratch/projects/data_center/k8s-services/postgres/test_setup.yaml
