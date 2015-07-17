FROM nginx

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
  git \
  php5-fpm
