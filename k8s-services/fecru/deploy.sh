#!/bin/bash
helm upgrade --install --create-namespace -n fecru fecru ./fecru -f override.yaml
