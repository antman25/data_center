#!/bin/bash
#echo -e '\e[38;5;198m'"++++ Killing any old consul process"
#sudo pkill -9 consul
#echo -e '\e[38;5;198m'"++++ Starting Consul in Server Mode"
sudo consul agent -bootstrap -config-file=../cfg/consul/consul_s1.json -config-dir=../cfg/consul.d
