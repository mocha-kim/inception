#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

sed -ie 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# init
service mysql start

mysql --user=$DATABASE_ROOT << EOF
UPDATE mysql.user SET Password=PASSWORD('$DATABASE_ROOT_PWD') WHERE User='$DATABASE_ROOT';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='$DATABASE_ROOT' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
EOF

mysql --user=$DATABASE_ROOT --password=$DATABASE_ROOT_PWD << EOF
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
CREATE USER IF NOT EXISTS '$DATABASE_USR'@'%' IDENTIFIED BY '$DATABASE_PWD';
GRANT ALL PRIVILEGES ON *.* TO '$DATABASE_ROOT'@'%' IDENTIFIED BY '$DATABASE_ROOT_PWD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%' IDENTIFIED BY '$DATABASE_PWD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

service mysql stop

exec /usr/sbin/mysqld -u root