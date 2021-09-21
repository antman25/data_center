#!/bin/bash
#    -v /mnt/scratch/appdata/prometheus:/etc/prometheus \

docker run \
    --name prometheus \
    -p 9090:9090 \
    prom/prometheus
