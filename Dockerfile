FROM nginx

RUN apt-get -y update
RUN apt-get install -y vim curl wget build-essential
RUN apt-get install -y nginx
RUN apt-get install -y php5-cli php5-fpm php5-mysql php5-pgsql php5-sqlite php5-curl\
		       php5-gd php5-mcrypt

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini
RUN sed -i "s/user = www-data/user = nginx/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/group = www-data/group = nginx/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/listen.owner = www-data/listen.owner = nginx/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/listen.group = www-data/listen.group = nginx/" /etc/php5/fpm/pool.d/www.conf

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
 
RUN mkdir -p             /var/www
RUN chown -R nginx:nginx /var/www
RUN chmod -R 755         /var/www

ADD build/default.conf   /etc/nginx/conf.d/default.conf

RUN update-rc.d nginx defaults
RUN update-rc.d php5-fpm defaults
RUN service php5-fpm restart
RUN service nginx restart

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
