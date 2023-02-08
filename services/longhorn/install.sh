#!/bin/bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace -f /mnt/scratch/projects/data_center/services/longhorn/values.yaml
