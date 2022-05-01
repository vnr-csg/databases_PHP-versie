FROM gitpod/workspace-mysql:latest

USER root

RUN install-packages figlet

# Install phpMyAdmin from source, see: https://docs.phpmyadmin.net/en/latest/setup.html#installing-from-git
RUN git clone https://github.com/phpmyadmin/phpmyadmin.git /usr/share/phpmyadmin --depth 1 --branch STABLE && cd /usr/share/phpmyadmin && composer update --no-dev && yarn install --production

# Copy phpMyAdmin config
COPY config.inc.php /usr/share/phpmyadmin/config.inc.php

# Configure apache for phpMyAdmin
RUN echo "Alias /phpmyadmin /usr/share/phpmyadmin\n\
<Directory /usr/share/phpmyadmin>\n\
    DirectoryIndex index.php\n\
    Require all granted\n\
</Directory>" > /etc/apache2/conf-available/phpmyadmin.conf \
&& a2enconf phpmyadmin

