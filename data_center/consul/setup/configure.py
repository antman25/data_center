#!/usr/bin/python3

import consul
import json

# ACL Policy Types - https://www.consul.io/docs/security/acl/acl-rules
# read: allow the resource to be read but not modified.
# write: allow the resource to be read and modified.
# deny: do not allow the resource to be read or modified.
# list: allows access to all the keys under a segment in the Consul KV. Note, this policy can only be used with

# Resources
# acl: resource controls access to ACL operations in the ACL API.
# agent/agent_prefix "node_name": The agent and agent_prefix resources control access to the utility operations in the Agent API, such as join and leave. 
# event/event_prefix "event_name": The event and event_prefix resources control access to event operations in the Event API, such as firing events and listing events.
# key/key_prefix "key_name": The key and key_prefix resources control access to key/value store operations in the KV API.
# keyring: The keyring resource controls access to keyring operations in the Keyring API.
# node/node_prefix: The node and node_prefix resources controls node-level registration and read access to the Catalog API, service discovery with the Health API, and filters results in Agent API operations like fetching the list of cluster members.
# operator: The operator resource controls access to cluster-level operations in the Operator API, other than the Keyring API.
# query/query_prefix: The query and query_prefix resources control access to create, update, and delete prepared queries in the Prepared Query API.
# service/service_prefix:  The service and service_prefix resources control service-level registration and read access to the Catalog API and service discovery with the Health API.
# session/sesion_prefix: The session and session_prefix resources controls access to Session API operations.


consul_s1 = 'consul-s1'

def policy_pair(name,path):
    return { 'name' : name,
             'path' : path 
            }

def bootstrap(client):
    bootstrap_data = None
    try:
        print("Attempting bootstrap the ACLs")
        bootstrap_data = client.acl.bootstrap()
        printBootstrap(bootstrap_data)
        with open('bootstrap.json', 'w') as f:
            f.write(json.dumps(bootstrap_data, sort_keys=True,indent=4))

    except Exception as ex:
        print("Failed to Bootstrap. Using cache. %s" % ex)
        with open('bootstrap.json','r') as f:
            bootstrap_data = json.loads(f.read())
    return bootstrap_data

def printBootstrap(bootstrap_data):
    management_key = bootstrap_data['SecretID']
    policies = bootstrap_data['Policies']
    print("ACL Management Bootstrap Key: %s" % management_key)
    print("Initial Managment Policies:")
    for policy in policies:
        name = policy['Name']
        id = policy['ID']
        print("\tName: %s" % name)
        print("\t\tID: %s" % id)
        #print("\t%s\t%s " % (name,id))

def loadPolicy(path):
    with open(path,'r') as f:
        return f.read()

def createMACL(client, token, name, policy_path):
    return createACL(client, token, name, 'management', policy_path)

def createACL(client, token, name, type, policy_path):
    create_response = client.acl.create(name=name, type=type, rules=loadPolicy(policy_path), acl_id=None, token=token)
    return create_response

def printACLList(acl_list,show_rule=False):
    print("ACL List[%i]:" % len(acl_list))
    for acl in acl_list:
        id = acl['ID']
        name = acl['Name']
        type = acl['Type']
        rules = acl['Rules']
        print("\tName: %s - Type: %s" % (name,type))
        print("\t\tID: %s" % id)
        if show_rule:
            print("\t\tRules:\n%s" % rules)
            print("****** END RULE *********")


def main():
    client = consul.Consul()
    bootstrap_data = bootstrap(client)
    management_token = bootstrap_data['SecretID']
    print("****** Starting ACL List ******")
    acl_list = client.acl.list(token=management_token)
    printACLList(acl_list,False)
    print("****** END ACL LIST ***********")

    policy_list = []
    #policy_list.append(policy_pair('admin', 'policy/admin-policy.hcl'))
    policy_list.append(policy_pair('consul-s1', 'policy/consul-s1.hcl'))
    for policy in policy_list:
        name = policy['name']
        path = policy['path']
        acl_token = createMACL(client, management_token, name, path)
        print("Created %s ACL ID: %s" % (name, acl_token))
    #listACL(client,management_token)
    

if __name__ == '__main__':
    main()

