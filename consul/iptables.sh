iptables --append PREROUTING --table nat --protocol tcp --dport 53 \
  --jump REDIRECT --to-port 8600
iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to :8600
