FROM naleruto/ada-webserver:01.00.00
USER root
COPY ./apache2/apache2.conf /etc/apache2/apache2.conf
COPY ./app /var/www/html


# WORKDIR /var/www/html/application/modules/sale/assets
# RUN chown -R www-data:www-data /var/www/html/
# WORKDIR /var/www/html/application/modules/report/assets
# RUN chmod 777 /var/www/html/application/modules/sale/assets
# RUN chmod 777 /var/www/html/application/modules/report/assets
RUN chmod 777 /var/www/html/application/logs