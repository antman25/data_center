#!/bin/bash
#docker run -d -p 8081:8081 --name nexus sonatype/nexus3
docker rm -f nexus
docker run -d -p 8081:8081 --name nexus -v /mnt/scratch/appdata/nexus:/nexus-data sonatype/nexus3
