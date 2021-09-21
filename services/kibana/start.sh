#!/bin/bash
docker run -d --name kibana -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://10.0.0.222:9200" docker.elastic.co/kibana/kibana:7.14.1
