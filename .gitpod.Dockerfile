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

# Install phpMyAdmin
RUN mkdir public -p \
 && cd public \
 && git clone https://github.com/phpmyadmin/phpmyadmin.git --depth 1 --branch STABLE \
 && cd phpmyadmin \
 && yarn install

# Install phpMyAdmin config
COPY config.inc.php ./public/phpmyadmin/config.inc.php
 
