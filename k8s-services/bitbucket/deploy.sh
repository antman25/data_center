#!/bin/bash
helm upgrade --install -n bitbucket-dev bitbucket atlassian-data-center/bitbucket --create-namespace --version 1.11.0 -f dev.yaml
