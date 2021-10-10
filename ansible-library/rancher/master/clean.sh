#!/bin/bash
docker rm -f $(docker ps -qa)
docker volume rm $(docker volume ls -q)
cleanupdirs="/var/lib/etcd /etc/kubernetes /etc/cni /var/lib/cni /var/run/calico /opt/rke /opt/rancher /opt/cni"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  rm -rf $dir
done
