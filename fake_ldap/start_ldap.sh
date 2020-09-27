echo "Stopping previous ldap container"
sudo docker stop ldap
echo "removing previos ldap container"
sudo docker rm ldap
echo "Starting test ldap image..."
sudo docker run --privileged -d -p 389:389 --name ldap rroemhild/test-openldap
