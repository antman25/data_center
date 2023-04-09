#!/bin/bash
helm upgrade --create-namespace -n bitbucket --install bitbucket . -f values.yaml
