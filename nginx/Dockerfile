FROM nginx:1.18

COPY conf/nginx.conf /etc/nginx/
COPY conf/default.conf /etc/nginx/conf.d/
COPY conf/upstream.conf /etc/nginx/conf.d/
COPY conf/.htpasswd /etc/nginx/conf.d/

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80 443
