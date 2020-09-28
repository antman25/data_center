#!/usr/bin/python3
import hvac
import json

vault_url = 'http://localhost:8200'
int_pki_path = 'pki_int/'
ldap_path = 'ldap/'

def getClient(url):
    client = hvac.Client(url=url)
    return client

def saveJson(data, path):
    with open(path,'w') as f:
        f.write(json.dumps(data,sort_keys=True,indent=4))


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


def configurePKI(client):
    print("Configuring PKI engine")
    mounted_engines = list(client.sys.list_mounted_secrets_engines().keys())
    #print(mounted_engines)
    if int_pki_path in mounted_engines:
        print("Internal PKI already mounted!")
    else:
        print("Enbling Internal PKI secret engine")
        resp = client.sys.enable_secrets_engine(backend_type='pki', path=int_pki_path,description='Inernal PKI',max_lease_ttl="43800h")
        print("Got Response: %s" % resp)
    print("Creating ca_intermediate role")
    resp = client.secrets.pki.create_or_update_role(name="ca_intermediate",
                                                    extra_params={  'ttl': '72h',
                                                                    'allow_localhost': 'false'
                                                                 },
                                                    mount_point=int_pki_path)
    print("Got Response: %s" % resp)
    print("Generating Root CA")

    #cert_list = client.secrets.pki.list_certificates(mount_point=int_pki_path)
    #print ("Cert List: %s" % cert_list)
    #print("Getting CA Chain PEM")
    #resp = client.secrets.pki.read_ca_certificate_chain(mount_point=int_pki_path)
    #print("Got resp %s" % resp)
    print ("Checking for existing CA Cert...")
    ca_cert = client.secrets.pki.read_ca_certificate(mount_point=int_pki_path)
    if len(ca_cert) == 0:
        print("No existing Root CA - Creating...")

        generate_root_response = client.secrets.pki.generate_root(type='exported',common_name='New root CA',mount_point=int_pki_path)

        saveJson(generate_root_response, 'ca_info.json')
        saveJson(generate_root_response['data']['issuing_ca'], 'root_ca.issue.pem')
        saveJson(generate_root_response['data']['certificate'], 'root_ca.cert.pem')
        saveJson(generate_root_response['data']['private_key'], 'root_ca.key.pem')
    else:
        print("Root CA Exists")

    #print ("Got Response: %s" % generate_root_response)
    #generate_certificate_response = client.secrets.pki.generate_certificate(name='ca_intermediate', common_name='vault.service.consul',mount_point=int_pki_path)
    #print ("Got Response: %s" % generate_certificate_response)

    #read_ca_certificate_response = client.secrets.pki.read_ca_certificate()
    #print(read_ca_certificate_response)
    #generate_certificate_response = self.client.secrets.pki.generate_certificate(name='myrole',common_name='test.example.com')
    #print("Certificate Response: %s" % generate_certificate_response)
    #ca_info = build_cert_bundle(bundle)
    #print("CA Cert Bundle: %s" % ca_info)
    #print("Submitting CA Key")
    #submit_ca_information_response = client.secrets.pki.submit_ca_information(ca_info)
    #print(submit_ca_information_response)
    #for eng in mounted_engines:
    #    print(eng)
    #client.sys.enable_secrets_engine(backend_type='pki', path='int_pki',description='Inernal PKI',max_lease_ttl="43800h")
 


def main():
    client = getClient(vault_url)
    with open('init.json', 'r') as f:
        data = f.read()
    init = json.loads(data)
    keys = init['keys']
    root_token = init['root_token']
    unsealVault(client, keys)
    client.token = root_token
    print('Vault initialize status: %s' % client.sys.is_initialized())
    configurePKI(client)
    

if __name__ == '__main__':
    main()
