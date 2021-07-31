firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -d 0.0.0.0/0 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 8600
firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -d 0.0.0.0/0 -p udp -m udp --dport 53 -j REDIRECT --to-ports 8600

- name: Forward port 53 (tcp) to port 8600 for consul DNS
    iptables:
      table: nat
      chain: OUTPUT
      protocol: tcp
      match: tcp
      destination_port: 53
      jump: REDIRECT
      to_ports: '8600'
      comment: Redirect web traffic to port 8600
    become: yes
  - name: Forward port 53 (udp) to port 8600 for consul DNS
    iptables:
      table: nat
      chain: OUTPUT
      protocol: udp
      match: udp
      destination_port: 53
      jump: REDIRECT
      to_ports: 8600
      comment: Redirect web traffic to port 8600
    become: yes

  - name: Forward requests for port 53 (tcp) to port 8600 (tcp)
    shell: firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -d 0.0.0.0/0 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 8600
  - name: Forward requests for port 53 (udp) to port 8600 (udp)
    shell: firewall-cmd --permanent --direct --add-rule ipv4 nat OUTPUT 0 -d 0.0.0.0/0 -p udp -m udp --dport 53 -j REDIRECT --to-ports 8600
  - name: Reload firewall
    shell: firewall-cmd --reload
