FROM nginx:stable

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    vim \
    nano \
    zsh \
    git \
    curl \
    wget \
    certbot

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/sonicradish/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

#RUN certbot certonly --webroot \
#    --staging \
#    --agree-tos \
#    -m kevin.raimbaud@geoks.fr \
#    -d example.com \
#    --webroot-path /var/www/html/web

EXPOSE 80 443
