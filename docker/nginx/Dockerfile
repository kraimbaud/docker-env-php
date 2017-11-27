FROM nginx:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install certbot -y

#RUN certbot certonly --webroot \
#    --staging \
#    --agree-tos \
#    -m kevin.raimbaud@geoks.fr \
#    -d example.com \
#    --webroot-path /var/www/html/web

EXPOSE 80 443
