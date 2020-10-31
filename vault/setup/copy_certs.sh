#sudo touch /etc/certs/ca-bundle.pem
#sudo chmod 666 /etc/certs/ca-bundle.pem
sudo cp root_ca.issue.pem root_ca.cert.pem root_ca.key.pem /etc/certs
sudo chmod 400 /etc/certs/root_ca.key.pem
sudo chmod 444 /etc/certs/root_ca.issue.pem /etc/certs/root_ca.cert.pem
#sudo cat /etc/certs/root_ca.cert.pem /etc/certs/root_ca.key.pem /etc/certs/root_ca.issue.pem > /etc/certs/ca-bundle.pem
#sudo chmod 444 /etc/certs/ca-bundle.pem

