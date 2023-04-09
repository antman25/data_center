#!/bin/bash
helm repo add jfrog https://charts.jfrog.io
helm repo update
helm upgrade --create-namespace --install artifactory-oss --set artifactory.postgresql.postgresqlPassword=password --namespace artifactory-oss jfrog/artifactory-oss -f dev.yaml
