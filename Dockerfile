FROM alpine:3.4
RUN apk --update --no-cache add apache2 php5-apache2 bash apache2-utils 
RUN mkdir -p /run/apache2
COPY app /var/www/html
COPY dir.conf /etc/apache2/conf.d/
COPY httpd-foreground /usr/local/bin/
EXPOSE 80
#CMD ["httpd-foreground"]
CMD ["/usr/sbin/apachectl","-DFOREGROUND"]
