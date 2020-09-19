#!/usr/bin/python3
import hvac


client = hvac.Client(url='https://localhost:8200')
auth = client.is_authenticated()

print ("Auth = %s" % str(auth))