#!/bin/bash
docker run --privileged --network host --name nexus-nginx -p 443:443 nexus-nginx:latest 
