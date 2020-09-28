sudo cp root_ca.issue.pem root_ca.cert.pem root_ca.key.pem /etc/certs
sudo chmod 444 /etc/certs/root_ca.issue.pem /etc/certs/root_ca.cert.pem /etc/certs/root_ca.key.pem
cat /etc/certs/root_ca.cert.pem /etc/certs/root_ca.key.pem /etc/certs/root_ca.issue.pem > /etc/certs/bundle.pem
sudo chmod 444 /etc/certs/bundle.pem

