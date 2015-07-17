FROM nginx

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install \
  git \
  php5-fpm \
  puppet
