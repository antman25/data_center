#!/bin/sh
helm install argocd -n argocd argo/argocd --values values.yaml
