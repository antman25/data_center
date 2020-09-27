#!/bin/bash
#echo -e '\e[38;5;198m'"++++ Killing any old consul process"
#sudo pkill -9 consul
#echo -e '\e[38;5;198m'"++++ Starting Consul in Server Mode"
sudo consul agent -config-dir=consul.d/bootstrap/
