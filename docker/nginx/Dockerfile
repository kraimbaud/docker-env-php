FROM nginx

RUN apt-get update && apt-get install -y \
    vim

ADD dev.conf /etc/nginx/conf.d/dev.conf
ADD prod.conf /etc/nginx/conf.d/prod.conf
