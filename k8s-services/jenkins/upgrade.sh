#!/bin/bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm upgrade -i -n jenkins jenkins jenkins/jenkins --create-namespace --install -f /mnt/scratch/projects/data_center/k8s-services/jenkins/test_setup.yaml 

