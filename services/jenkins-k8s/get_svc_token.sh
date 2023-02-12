#!/bin/bash
SECRET_NAME=$(kubectl get serviceaccount jenkins-admin -n workflow -o=jsonpath='{.secrets[0].name}')
echo "Secret Name: $SECRET_NAME"
kubectl get secrets $SECRET_NAME  -o=jsonpath='{.data.token}' -n workflow | base64 -d
