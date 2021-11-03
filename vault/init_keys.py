#!/usr/bin/env python3
import hvac
import json

def main():
	client = hvac.Client(url='http://vault.antlinux.local:8200')
	if client.sys.is_initialized() == False:
		shares = 5
		threshold = 3
		result = client.sys.initialize(shares, threshold)
		root_token = result['root_token']
		print("Root Token: %s" % root_token)
		with open("init_data/root_token","w") as f:
			f.write(root_token + "\n")

		keys = result['keys']
		output_data = { "keys" : keys }
		with open("init_data/keys.json", "w") as f:
			f.write(json.dumps(output_data))

		for key in keys:
			print("Unseal key: %s" % key)

	
		print("Vault is_initialized = %s" % client.sys.is_initialized())
	else:
		print("Vault already initialized")

if __name__ == '__main__':
	main()
