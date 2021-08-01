echo "Stopping previous ldap container"
sudo docker stop ldap
echo "removing previos ldap container"
sudo docker rm ldap
echo "Starting test ldap image..."
sudo docker run --rm -p 10389:10389 -p 10636:10636 --name ldap rroemhild/test-openldap
