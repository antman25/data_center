#!/bin/bash
TF_VAR_vault_token=${VAULT_TOKEN} terraform destroy -auto-approve -input=false
