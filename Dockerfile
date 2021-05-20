FROM nginx:1.19

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y apache2-utils \
  && apt-get clean

RUN mkdir -p /var/www/default
COPY error.html /var/www/default/error.html

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/proxy.conf

EXPOSE 8090

CMD ["/docker-entrypoint.sh"]
