FROM nginx

COPY ./nginx.conf /etc/nginx/conf.d/proxy.conf

RUN rm /etc/nginx/conf.d/default.conf
RUN apt-get update
RUN apt-get install -y apache2-utils

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]

EXPOSE 8090
