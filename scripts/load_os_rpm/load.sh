#!/bin/bash
for file in /mnt/cdrom/AppStream/Packages/*; do curl -k -u packer:packer --upload-file $file https://nexus.antlinux.local:8443/repository/yum-os/centos/8/AppStream/x86_64/os/$file; done
