#!/bin/bash
docker rm -f jenkins
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /mnt/scratch/volumes/jenkins:/var/jenkins_home nexus.antlinux.local:8443/vendor-base/jenkins/jenkins:2.319
