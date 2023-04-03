#!/bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade -i -n sonarqube sonarqube bitnami/sonarqube -f values.yaml
