#!/usr/bin/python3

import consul
import json

def main():
    c = consul.Consul()
    bootstrap_data = None
    try:
        print("Attempting bootstrap the ACLs")
        bootstrap_data = c.acl.bootstrap()
        print("Bootstrap Response: %s" % bootstrap_data)
        with open('bootstrap.json', 'w') as f:
            f.write(json.dumps(bootstrap_data, sort_keys=True,indent=4))

    except Exception as ex:
        print(ex)
        print("Unabled to bootstrap - loading from cache")
        with open('bootstrap.json','r') as f:
            bootstrap_data = json.loads(f.read())
        #print(bootstrap_data)
    management_key = bootstrap_data['SecretID']

    print("ACL Management Bootstrap Key: %s" % management_key)


if __name__ == '__main__':
    main()

