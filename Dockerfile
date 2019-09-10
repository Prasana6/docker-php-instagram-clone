#FROM httpd:2.4
#RUN rm -rf /usr/local/apache2/htdocs/index.html
#RUN apt-get install php -y && apt-get install php7.2-mysqli
#COPY ./Simple-PHP-Web-App/* /usr/local/apache2/htdocs/
#EXPOSE 80
#ENTRYPOINT ["/usr/local/apache2/htdocs/index.php"]


#FROM php:7.2
#RUN apt-get install php7.2-mysqli -y
#COPY ./Simple-PHP-Web-App/* /usr/src/myapp/
#WORKDIR /usr/src/myapp
#CMD [ "php", "./index.php" ]


FROM php:7.3-apache
#MAINTAINER Silgon <silgon3200@gmail.com>

RUN docker-php-ext-install mysqli pdo_mysql
RUN apt-get update && apt-get install vim -y
#RUN rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/

RUN a2enmod rewrite && service apache2 restart
# next commands are not needed because they are repeated from others
EXPOSE 80
CMD ["apache2-foreground"]
