#!/bin/bash
docker run --network host --name consul -v /mnt/scratch/volumes/consul:/consul/data -v /mnt/scratch/appdata/consul-config:/consul/config consul 
#docker run --network host --name consul -v /mnt/scratch/volumes/consul:/consul/data consul 
