FROM valian/docker-nginx-auto-ssl

# establish where Nginx should look for files
ENV RAILS_ROOT /var/www/fitfree

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# create log directory
RUN mkdir log

# copy over static assets
COPY public public/

# Copy Nginx config template
COPY docker/nginx/nginx.conf /usr/local/openresty/nginx/conf/
COPY docker/ssl_keys/localhost.crt /usr/local/openresty/nginx/conf/localhost.crt
COPY docker/ssl_keys/localhost.key /usr/local/openresty/nginx/conf/localhost.key

EXPOSE 90 443

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]