#!/bin/bash
helm upgrade --install -n mattermost mattermost mattermost/mattermost-team-edition --create-namespace -f /mnt/scratch/projects/data_center/k8s-services/mattermost/test_setup.yaml
