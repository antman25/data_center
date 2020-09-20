#!/bin/sh
#cur_image=`sudo docker ps | grep instance_config | awk '{print $1}'`
#echo "Found running image ${cur_image}"
sudo docker exec -it flask-repo-app /bin/sh
