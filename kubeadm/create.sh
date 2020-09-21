#!/bin/sh
echo "Kube Init..."
sudo kubeadm init > init.txt
echo "Creating worker node join script..."
tail -n2 init.txt > join_master.sh
chmod +x join_master.sh
echo "Copying new kube configs..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
cd; tar cvzf kube_config.tar.gz .kube/config
