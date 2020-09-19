sudo docker run -d --name=consul-client1 -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=172.17.0.4
