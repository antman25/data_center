sudo docker run \
           --detach \
           --name=lum \
           -p 80:80 \
           -p 443:443 \
           -e "SERVER_HOSTNAME=172.17.0.1" \
           -e "LDAP_URI=ldap://172.17.0.1" \
           -e "LDAP_BASE_DN=dc=planetexpress,dc=com" \
           -e "LDAP_REQUIRE_STARTTLS=FALSE" \
           -e "LDAP_ADMINS_GROUP=admin_staff" \
           -e "LDAP_ADMIN_BIND_DN=cn=admin,dc=planetexpress,dc=com" \
           -e "LDAP_ADMIN_BIND_PWD=GoodNewsEveryone"\
           -e "LDAP_USES_NIS_SCHEMA=true" \
           -e "EMAIL_DOMAIN=example.com"\
           wheelybird/ldap-user-manager:v1.2
