#!/bin/sh
export VAULT_ADDR=http://127.0.0.1:8200
echo -e '\e[38;5;198m'"++++ Removing old data"
sudo rm -rf /var/lib/vault/data/*

echo -e '\e[38;5;198m'"++++ initializing new vault"
sudo vault operator init > /etc/vault/init.file

echo -e '\e[38;5;198m'"++++ Auto unseal vault"
for i in $(cat /etc/vault/init.file | grep Unseal | cut -d " " -f4 | head -n 3); do vault operator unseal $i; done
sudo vault status
sudo cat /etc/vault/init.file
