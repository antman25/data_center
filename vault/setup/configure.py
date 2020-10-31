#!/usr/bin/python3
import hvac
import json

vault_url = 'http://localhost:8200'
int_ca_pki_path = 'pki_intermediate/'
root_ca_pki_path = 'pki_root/'


def getClient(url):
    client = hvac.Client(url=url)
    return client


def saveJson(data, path):
    with open(path, 'w') as f:
        f.write(json.dumps(data, sort_keys=True, indent=4))


def savePEM(data, path):
    with open(path, 'w') as f:
        f.write(data)


def unsealVault(client, keys):
    if client.sys.is_sealed():
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


def loadRootCA(client):
    bundle = ['/etc/certs/intermediate_ca.decrypted-key.pem', '/etc/certs/intermediate_ca.cert.pem']
    bundle_data = ""
    for path in bundle:
        print("Processing Path %s" % path)
        with open(path, 'r') as f:
            bundle_data += f.read()
    savePEM(bundle_data, 'bundle.pem')
    print("Loading Root CA Content...")
    submit_ca_information_response = client.secrets.pki.submit_ca_information(bundle_data, mount_point=root_ca_pki_path)
    print("Got Response: %s" % submit_ca_information_response)


def generateRootCA(client):
    generate_root_response = client.secrets.pki.generate_root(type='internal', common_name='antman root ca',
                                                              mount_point=root_ca_pki_path)
    print("Generate root response: %s" % generate_root_response)
    saveJson(generate_root_response, 'root_ca_info.json')
    # savePEM(generate_root_response['data']['issuing_ca'], 'root_ca.issue.pem')
    savePEM(generate_root_response['data']['certificate'], 'root_ca.cert.pem')
    # savePEM(generate_root_response['data']['private_key'], 'root_ca.key.pem')
    return generate_root_response


def mountPKI(client):
    mounted_engines = list(client.sys.list_mounted_secrets_engines().keys())
    if root_ca_pki_path in mounted_engines:
        print("Root CA PKI already mounted!")
    else:
        print("Enabling Root CA PKI Engine")
        resp = client.sys.enable_secrets_engine(backend_type='pki', path=root_ca_pki_path,
                                                description='Root CA PKI Testing', max_lease_ttl="43800h")

    if int_ca_pki_path in mounted_engines:
        print("Intermediate CA PKI already mounted!")
    else:
        print("Enabling Intermediate CA PKI Engine")
        resp = client.sys.enable_secrets_engine(backend_type='pki', path=int_ca_pki_path,
                                                description='Intermediate CA PKI Testing', max_lease_ttl="21400h")
        # print("Got Response: %s" % resp)


def configurePKI(client):
    print("Configuring PKI engine")
    mountPKI(client)
    # print(mounted_engines)

    '''
    print("Creating ca_intermediate role")
    resp = client.secrets.pki.create_or_update_role(name="testrole",
                                                    extra_params={  'ttl': '72h',
                                                                    'allow_localhost': 'false'
                                                                 },
                                                    mount_point=int_pki_path)
    print("Got Response: %s" % resp)
    #print("Generating Root CA")
    '''

    # cert_list = client.secrets.pki.list_certificates(mount_point=int_pki_path)
    # print ("Cert List: %s" % cert_list)
    # print("Getting CA Chain PEM")
    resp = client.secrets.pki.read_ca_certificate_chain(mount_point=root_ca_pki_path)
    # print("CA CERT CHAIN resp ***%s***" % resp)
    print("Checking for existing CA Cert...")
    ca_cert = client.secrets.pki.read_ca_certificate(mount_point=root_ca_pki_path)
    # print ("READ CA CERT = '%s'" % ca_cert)
    if len(ca_cert) > 0:
        print("Root CA Exists")
        # delete_root_response = client.secrets.pki.delete_root(mount_point=int_pki_path)
        # print ("Delete CA Response: %s" % delete_root_response)
    else:
        print("Generating New Root CA")
        generate_root_response = generateRootCA(client)
        print("Root CA Request: %s" % generate_root_response)

    print("Setting CRL / Issuer URL")
    set_urls_response = client.secrets.pki.set_urls({'issuing_certificates': ['http://127.0.0.1:8200/v1/pki/ca'],
                                                     'crl_distribution_points': ['http://127.0.0.1:8200/v1/pki/crl']},
                                                    mount_point=root_ca_pki_path)
    print("Got Response: %s" % set_urls_response)

    print("Setting CRL Config")
    set_crl_configuration_response = client.secrets.pki.set_crl_configuration(expiry='72h', disable=False,
                                                                              mount_point=root_ca_pki_path)
    print("Got Response: %s" % set_crl_configuration_response)

    resp = client.secrets.pki.read_ca_certificate_chain(mount_point=int_ca_pki_path)
    # print("INTERMEDIATE CA CERT CHAIN resp ***%s***" % resp)
    print("Checking for existing INTERMEDIATE CA Cert...")
    ca_cert = client.secrets.pki.read_ca_certificate(mount_point=int_ca_pki_path)
    # print ("READ INTERMEDIATECA CERT = '%s'" % ca_cert)
    if len(ca_cert) == 0:
        print("Generating Intermediate CA CSR Cert...")
        generate_intermediate_response = client.secrets.pki.generate_intermediate(type='exported',
                                                                                  common_name='antman intermediate ca',
                                                                                  mount_point=int_ca_pki_path)
        saveJson(generate_intermediate_response, 'intermediate_ca_info.json')
        # print ("Got Response: %s" % generate_intermediate_response)
        print("Saving CSR/Private Key to disk...")
        savePEM(generate_intermediate_response['data']['csr'], 'int_ca.csr.pem')
        savePEM(generate_intermediate_response['data']['private_key'], 'int_ca.key.pem')

        csr = generate_intermediate_response['data']['csr']
        print("Attempting to sign intermediate CA")
        sign_intermediate_response = client.secrets.pki.sign_intermediate(csr=csr,
                                                                          common_name='antman intermediate ca test',
                                                                          mount_point=root_ca_pki_path)
        print("Got Response: %s" % sign_intermediate_response)
        intermediate_ca_cert = sign_intermediate_response['data']['certificate']
        issuing_ca_cert = sign_intermediate_response['data']['issuing_ca']
        savePEM(intermediate_ca_cert, 'int_ca.cert.pem')
        set_signed_intermediate_response = client.secrets.pki.set_signed_intermediate(intermediate_ca_cert,
                                                                                      mount_point=int_ca_pki_path)
    else:
        print("INTERMEDIATE CA Exists")


def enableLdapAuth(client):
    ldap_auth_path = 'company-ldap'
    description = "Auth method for use by team members in our company's LDAP organization"

    if '%s/' % ldap_auth_path not in client.sys.list_auth_methods():
        print('Enabling the ldap auth backend at mount_point: {path}'.format(
            path=ldap_auth_path,
        ))
        client.enable_auth_method(
            backend_type='ldap',
            description=description,
            mount_point=ldap_auth_path,
        )
    print('Configuring LDAP')
    resp = client.auth.ldap.configure(
        user_dn='ou=people,dc=planetexpress,dc=com',
        url='ldap://127.0.0.1:389',
        bind_dn='cn=admin,dc=planetexpress,dc=com',
        bind_pass='GoodNewsEveryone',
        user_attr='uid',
        group_attr='cn',
        mount_point=ldap_auth_path)
    print("Response: %s" % resp)


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
    enableLdapAuth(client)


if __name__ == '__main__':
    main()
