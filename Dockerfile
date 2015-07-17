FROM nginx

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
  git \
  php5-fpm

RUN echo "rm -Rf /usr/share/nginx/html/*" > /root/init.sh
RUN echo "git clone \$GITREPO /usr/share/nginx/html" >> /root/init.sh
RUN chmod +x /root/init.sh
RUN /root/init.sh

RUN service php5-fpm restart
RUN service nginx restart

EXPOSE 80
