#!/bin/bash
sudo docker run --network host --name elasticsearch -v /mnt/scratch/volumes/elasticsearch:/usr/share/elasticsearch/data  -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.14.1
