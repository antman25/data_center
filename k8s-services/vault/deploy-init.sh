#!/bin/bash
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update
helm upgrade --install -n vault vault hashicorp/vault --create-namespace -f vault-init.yaml
