#!/bin/bash
#helm upgrade jenkins jenkins/jenkins --install
helm upgrade -n workflow jenkins jenkins/jenkins --create-namespace --install -f /mnt/scratch/projects/data_center/k8s-services/jenkins/test_setup.yaml 

