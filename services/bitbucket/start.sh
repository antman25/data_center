#!/bin/bash
#docker rm -f  bitbucket
#docker run -d -p 8081:8081 --name nexus -v /mnt/scratch/appdata/nexus:/nexus-data sonatype/nexus3

docker rm -f bitbucket-postgres
docker rm -f bitbucket
docker rm -f jenkins

docker network rm myBitbucketNetwork


docker network create --driver bridge --subnet=172.50.0.0/16 myBitbucketNetwork

docker run --network=myBitbucketNetwork --ip=172.50.1.3 -d \
           --name="jenkins" \
           -p 8080:8080 \
           -p 50000:50000 \
           -v /mnt/scratch/volumes/jenkins:/var/jenkins_home \
           jenkins/jenkins:2.389


docker run --network=myBitbucketNetwork --ip=172.50.1.2 -d \
    --name="bitbucket-postgres" \
    -e POSTGRES_PASSWORD=password \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /mnt/scratch/volumes/bitbucket-postgres:/var/lib/postgresql/data \
    -p 5432:5432 \
    postgres


docker run --network=myBitbucketNetwork --ip=172.50.1.1 -d \
    -e SEARCH_ENABLED=false \
    -e JDBC_DRIVER=org.postgresql.Driver \
    -e JDBC_USER=atlbitbucket \
    -e JDBC_PASSWORD=password \
    -e JDBC_URL=jdbc:postgresql://172.50.1.2:5432/bitbucket \
    -e PLUGIN_SEARCH_CONFIG_BASEURL=http://my.opensearch.host \
    -v /mnt/scratch/volumes/bitbucket:/var/atlassian/application-data/bitbucket/shared \
    --name="bitbucket" \
    -d -p 7990:7990 -p 7999:7999 \
    atlassian/bitbucket
