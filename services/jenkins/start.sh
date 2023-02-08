#!/bin/bash
docker rm -f jenkins
docker run -d --privileged --name jenkins -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /mnt/scratch/volumes/jenkins:/var/jenkins_home jenkins/jenkins:2.389
