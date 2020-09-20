#!/bin/sh
cur_image=`sudo docker ps | grep flask-repo-app | awk '{print $1}'`
echo "Found image is ${cur_image}"
echo "Stopping ${cur_image}"; sudo docker stop ${cur_image} && \
echo "Removing Image"; sudo docker rm flask-repo-app && \
echo "Building Image"; sudo docker build -t flask-repo-app:latest . && \
echo "Pruning images"; sudo docker image prune -f && \
echo "Starting Container"; sudo docker run --name flask-repo-app -d -p 18080:8080 --rm flask-repo-app:latest
