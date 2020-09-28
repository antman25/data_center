#!/usr/bin/python3
import hvac
import json

vault_url = 'http://localhost:8200'

def getClient(url):
    client = hvac.Client(url=url)
    return client

def initVault(client):
    vault_init_state = client.sys.is_initialized()
    print("Checking current vault state...")
    if vault_init_state == False:
        print("Vault init needed...")
        shares = 5
        threshold = 3
        print("Creating %i unseal keys - Required number %i" % (shares,threshold))
        result = client.sys.initialize(shares,threshold)
        with open('init.json', 'w') as f:
            j = json.dumps(result,sort_keys=True, indent=4)
            f.write(j)
        return result
    else:
        print("Vault is already initialized")
    return None

def unsealVault(client, keys):
    if client.sys.is_sealed() == True:
        for key in keys:
            if client.sys.is_sealed():
                print("Vault is sealed - Trying unseal key...")
                unseal_response = client.sys.submit_unseal_key(key)
                if unseal_response:
                    print("Unseal key accepted")
                else:
                    print("Unseal key FAIL")
            else:
                print("Vault is unsealed")
                break


def main():
    client = getClient(vault_url)
    init_result = initVault(client)
    if init_result:
        keys = init_result['keys']
        root_token = init_result['root_token']
        unsealVault(client,keys)
    else:
        with open('init.json', 'r') as f:
            data = f.read()
            init = json.loads(data)
        keys = init['keys']
        root_token = init['root_token']
    client.token = root_token
    print('Vault initialize status: %s' % client.sys.is_initialized())
    for key in keys:
        print("Unseal key: %s" % key)
    print("Root Token: %s" % root_token)
    

if __name__ == '__main__':
    main()
