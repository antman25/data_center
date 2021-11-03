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
			f.write(root_token)

		keys = result['keys']
		output_data = { "keys" : keys, "shares" : shares, "threshold" : threshold }
		with open("init_data/keys.json", "w") as f:
			j = json.dumps(output_data,sort_keys=True, indent=4)
			f.write(j)

		for key in keys:
			print("Unseal key: %s" % key)

	
		print("Vault is_initialized = %s" % client.sys.is_initialized())
	else:
		print("Vault already initialized")

if __name__ == '__main__':
	main()
