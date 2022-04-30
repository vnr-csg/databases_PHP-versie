FROM gitpod/workspace-mysql:latest

USER root

# Install phpMyAdmin
RUN install-packages phpmyadmin

# Configure phpMyAdmin
RUN echo "Alias /phpmyadmin /usr/share/phpmyadmin \n\
<Directory /usr/share/phpmyadmin> \n\
    Options SymLinksIfOwnerMatch \n\
    DirectoryIndex index.php \n\
    Require all granted \n\
</Directory>" > /etc/apache2/conf-available/phpmyadmin.conf \
 && a2enconf phpmyadmin

# Copy phpMyAdmin config
COPY config.inc.php /usr/share/phpmyadmin/config.inc.php
 