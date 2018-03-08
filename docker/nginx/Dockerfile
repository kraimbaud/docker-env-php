FROM nginx:stable

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    vim \
    nano \
    zsh \
    git \
    curl \
    wget \
    certbot \
    cron

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/sonicradish/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

COPY cron/certbot /etc/cron.d/certbot
RUN chmod 0644 /etc/cron.d/certbot
RUN service cron start

EXPOSE 80 443

