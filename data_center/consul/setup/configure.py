#!/usr/bin/python3

import consul
bootstrap_token = 'e79a8787-827e-13b1-c487-aec201a6be10'
def main():
    c = consul.Consul()
    try:
        print("Attempting bootstrap the ACLs")
        bootstrap_response = c.acl.bootstrap()
        print("Bootstrap Response: %s" % bootstrap_response)
        management_key = bootstrap_response[

    except:
        print("No bootstrap necessary"

if __name__ == '__main__':
    main()

