FROM nginx:1.21.3

#COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY certs/nexus-app-cert.pem          /etc/nginx/ssl/
COPY certs/nexus-app-key.pem          /etc/nginx/ssl/


RUN  touch /var/log/nginx/error.log

