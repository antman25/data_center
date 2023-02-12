#!/bin/bash
#helm upgrade jenkins jenkins/jenkins --install
helm upgrade -n workflow jenkins jenkins/jenkins --install -f /mnt/scratch/projects/data_center/services/jenkins-k8s/test_setup.yaml 

