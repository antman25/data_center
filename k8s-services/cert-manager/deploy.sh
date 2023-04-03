#!/bin/bash
helm repo add cert-manager https://charts.jetstack.io
helm repo update
helm upgrade -i --create-namespace -n cert-manager cert-manager cert-manager/cert-manager --version 1.11.0 --set installCRDs=true
