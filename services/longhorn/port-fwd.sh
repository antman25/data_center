#!/bin/bash
kubectl port-forward -n longhorn-system svc/longhorn-frontend 30000:80
