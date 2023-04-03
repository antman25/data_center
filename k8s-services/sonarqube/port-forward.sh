#!/bin/bash
kubectl port-forward -n sonarqube-copy svc/sonarqube-sonarqube 9000:9000
