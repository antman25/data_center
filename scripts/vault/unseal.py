#!/usr/bin/env python3
import hvac
import json

vault_url = 'http://vault.antlinux.local:8200'

def getClient(url):
	client = hvac.Client(url=url)
	return client

def unsealVault(client, keys):
	if client.sys.is_sealed() == True:
		for key in keys:
			if client.sys.is_sealed():
				print("Trying unseal key %s" % key)
				unseal_response = client.sys.submit_unseal_key(key)
				if unseal_response:
					print("Unseal key accepted")
				else:
					print("Unseal key FAIL")
			else:
				print("Vault is unsealed")
				break
	else:
		print("Vault is already unsealed")


def main():
	client = getClient(vault_url)
	with open('init_data/root_token', 'r') as f:
		root_token = f.read()
	with open('init_data/keys.json', 'r') as f:
		data = f.read()
		init = json.loads(data)
	keys = init['keys']
	unsealVault(client,keys)
	client.token = root_token
	print('Vault initialize status: %s' % client.sys.is_initialized())
	for key in keys:
		print("Unseal key: %s" % key)
	print("Root Token: %s" % root_token)
    

if __name__ == '__main__':
    main()
