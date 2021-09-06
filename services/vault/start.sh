#!/bin/bash
docker run --network host --name vault --cap-add=IPC_LOCK -p 8200:8200 -v /mnt/scratch/volumes/vault:/vault/file -e 'VAULT_LOCAL_CONFIG={"backend": {"file": {"path": "/vault/file"}}, "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui" : true }' vault server -dev
