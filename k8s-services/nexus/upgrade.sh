#!/bin/bash
helm upgrade --install -n nexus nexus sonatype/nexus-repository-manager --create-namespace --version 47.1.0 -f /mnt/scratch/projects/data_center/k8s-services/test_setup.yaml
