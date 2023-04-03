helm repo add longhorn https://charts.longhorn.io
helm repo update
helm upgrade --install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace -f /mnt/scratch/projects/data_center/k8s-services/longhorn/test_setup.yaml
