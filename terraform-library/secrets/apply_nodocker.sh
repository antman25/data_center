#!/bin/bash
TF_VAR_vault_token=${VAULT_TOKEN} terraform apply -auto-approve -input=false
