#!/bin/sh
#export VAULT_ADDR=http://127.0.0.1:8200
echo "++++ Removing old data"
sudo rm -rf /var/lib/vault/*
echo "++++ Starting vault"
sudo -u vault vault server -config=vault.d/bootstrap/vault_s1.hcl

