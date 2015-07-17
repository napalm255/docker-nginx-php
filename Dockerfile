FROM nginx

ENV GITREPO https://github.com/napalm255/phpinfo.git

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
  git \
  php5-fpm

RUN rm /usr/share/nginx/html/*
RUN git clone $GITREPO /usr/share/nginx/html

RUN service php5-fpm restart
RUN service nginx restart

EXPOSE 80
