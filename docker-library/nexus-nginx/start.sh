#!/bin/bash
docker rm -f nexus-nginx
docker run -d --privileged --network host --name nexus-nginx nexus-nginx:latest 
