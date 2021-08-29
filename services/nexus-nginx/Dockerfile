FROM nginx

#COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./certs/*          /etc/nginx/ssl/
RUN  touch /var/log/nginx/error.log

