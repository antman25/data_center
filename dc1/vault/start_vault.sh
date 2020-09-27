#!/bin/sh
#export VAULT_ADDR=http://127.0.0.1:8200
#echo -e '\e[38;5;198m'"++++ Starting Server"
/usr/bin/vault server -config=vault.d/vault_s1.hcl

