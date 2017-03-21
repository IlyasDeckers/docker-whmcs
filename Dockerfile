FROM smartentry/ubuntu:16.04

MAINTAINER Ilyas Deckers <ilyas@phasehosting.io>

RUN apt-get update && \
apt-get install -qqy nginx esmtp-run unzip subversion libxml2 libcurl4-openssl-dev sqlite3 libsqlite3-dev wget curl php-cli php-dev php-cli php-mysql php-pgsql php-mcrypt php-mbstring php-soap php-zip php-curl php-json php-gd php-fpm php-pear php-intl php-xmlrpc php-imap cron supervisor && \
apt-get clean -qq && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -O /tmp/ioncube_loaders_lin_x86-64.tar.gz && \
tar -C /tmp -xzf /tmp/ioncube_loaders_lin_x86-64.tar.gz && \
cp /tmp/ioncube/ioncube_loader_lin_7.0.so /usr/lib/php/20151012/ && \
rm -rf /tmp/ioncube /tmp/ioncube_loaders_lin_x86-64.tar.gz 

ADD . $ASSETS_DIR
RUN smartentry.sh build

RUN service php7.0-fpm start

EXPOSE 80

VOLUME /var/log

CMD ["/usr/bin/supervisord"]
