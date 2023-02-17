#!/bin/bash
#docker rm -f  bitbucket
#docker run -d -p 8081:8081 --name nexus -v /mnt/scratch/appdata/nexus:/nexus-data sonatype/nexus3

docker rm -f bitbucket-postgres


docker run --network=host -d \
    --name="bitbucket-postgres" \
    -e POSTGRES_PASSWORD=password \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /mnt/scratch/volumes/bitbucket-postgres:/var/lib/postgresql/data \
    postgres


