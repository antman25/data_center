#!/bin/bash
helm upgrade --install -n nexus nexus sonatype/nexus-repository-manager --create-namespace --version 51.0.0 -f dev.yaml
