FROM nginx

#COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY /mnt/scratch/projects/data_center/terraform-library/ca/certs/nexus-app-cert.pem          /etc/nginx/ssl/
COPY /mnt/scratch/projects/data_center/terraform-library/ca/certs/nexus-app-key.pem          /etc/nginx/ssl/


RUN  touch /var/log/nginx/error.log

