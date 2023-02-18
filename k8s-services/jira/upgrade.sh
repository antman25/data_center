#!/bin/bash
helm upgrade --install -n jira jira atlassian-data-center/jira -f /mnt/scratch/projects/data_center/k8s-services/jira/test_setup.yaml
