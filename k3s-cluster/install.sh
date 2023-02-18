#!/bin/bash
curl -sfL https://get.k3s.io | sh -s - server \
  --write-kubeconfig-mode 644 \
  --tls-san 10.0.0.31 \
  --tls-san 10.0.0.32 \
  --tls-san 10.0.0.33 \
  --disable traefik \
  --disable servicelb
