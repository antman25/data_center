#!/bin/bash
user=$EUID
if [ "${user}" != "0" ]; then
  echo
  echo "$0 must be run as root - you are running as $EUID"
  echo
  exit 1
fi
echo
echo "About to destroy Rancher 2.x install"
echo "2s to cancel with ^c"
echo
sleep 2

containers=$(docker ps -a | grep -E "rancher|k8s" | awk '{print $1}')
if [ "${containers}x" != "x" ]
then
  docker rm -f $containers
else
  echo "No containers - ignoring docker rm"
fi

images=$(docker images -a | grep -E "rancher|k8s" | awk '{print $3}')
if [ "${images}x" != "x" ]
then
  docker rmi $images
else
  echo "No images - ignoring docker rmi"
fi

docker volume prune

for mount in $(mount | grep tmpfs | grep '/var/lib/kubelet' | awk '{ print $3 }') /var/lib/kubelet /var/lib/rancher; do umount $mount; done

cleanupdirs="/var/lib/etcd /var/lib/rancher /var/lib/cni /var/lib/calico /var/lib/kubelet /var/run/calico /var/log/containers /var/log/kube-audit /var/log/pods /etc/kubernetes /etc/cni /etc/ceph /opt/cni /opt/rke /opt/rancher /opt/containerd /run/secrets/kubernetes.io /run/calico /run/flannel"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  rm -rf $dir
done

#https://rancher.com/docs/rancher/v2.5/en/cluster-admin/cleaning-cluster-nodes/
