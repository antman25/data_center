#!/usr/bin/python3

import consul
bootstrap_token = 'e79a8787-827e-13b1-c487-aec201a6be10'
def main():
    c = consul.Consul()

    token = c.acl.bootstrap()
    #token = c.acl.create(type='management',token=bootstrap_token)
    print("Token: %s" % token)

if __name__ == '__main__':
    main()

