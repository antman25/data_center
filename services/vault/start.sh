#!/bin/bash
docker rm -f vault
docker run --network host --name vault --cap-add=IPC_LOCK -p 8200:8200 -v ${PWD}/resolv.conf:/etc/resolv.conf -v /mnt/scratch/volumes/vault:/vault/file -v /mnt/scratch/appdata/vault-config:/config vault server -config=/config
