# This Dockerfile installs MySQL for Gitpod
# Node is already included by default in Gitpod

FROM gitpod/workspace-full

USER root

# Install MySQL
RUN install-packages mysql-server figlet \
 && mkdir -p /var/run/mysqld /var/log/mysql \
 && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

# Install and configure phpMyAdmin
RUN install-packages phpmyadmin \
 && echo "Alias /phpmyadmin /usr/share/phpmyadmin\n\
<Directory /usr/share/phpmyadmin>\n\
    Options SymLinksIfOwnerMatch\n\
    DirectoryIndex index.php\n\
    Require all granted\n\
</Directory>" > /etc/apache2/conf-available/phpmyadmin.conf \
 && a2enconf phpmyadmin

# Copy phpMyAdmin config
COPY config.inc.php /usr/share/phpmyadmin/config.inc.php
 
