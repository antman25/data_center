#!/usr/bin/python3
import hvac

#client = hvac.Client(url='http://127.0.0.1:8200')
#test = client.is_authenticated()
#print(test)

#create_response = client.secrets.kv.v2.create_or_update_secret(path='foo',secret=dict(baz='bar'))
#print("resp %s" % create_response)

client_cert_path =''
client_key_path=''
server_cert_path=''

vault_url = 'http://localhost:8200'

def getClient(url):
    client = hvac.Client(url=url)
    if client.is_authenticated():
        return client
    return None

def main():
    client = getClient(vault_url)
    print(client)

if __name__ == '__main__':
    main()
