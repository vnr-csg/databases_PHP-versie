FROM gitpod/workspace-mysql:latest

USER root

# Install phpMyAdmin from source, see: https://docs.phpmyadmin.net/en/latest/setup.html#installing-from-git
RUN git clone https://github.com/phpmyadmin/phpmyadmin.git /workspace/phpmyadmin --depth 1 --branch STABLE && cd /workspace/phpmyadmin && composer update --no-dev && yarn install --production

# Configure apache for phpMyAdmin
RUN echo "Alias /phpmyadmin /workspace/phpmyadmin\n\
<Directory /usr/share/phpmyadmin>\n\
    DirectoryIndex index.php\n\
    Require all granted\n\
</Directory>" > /etc/apache2/conf-available/phpmyadmin.conf \
&& a2enconf phpmyadmin

# Copy phpMyAdmin config
COPY config.inc.php /usr/share/phpmyadmin/config.inc.php
