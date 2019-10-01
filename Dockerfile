FROM nginx

RUN apt-get update \
  && apt-get install -y apache2-utils \
  && apt-get clean

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/proxy.conf

EXPOSE 8090

CMD ["/docker-entrypoint.sh"]

