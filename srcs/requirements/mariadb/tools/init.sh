#!/bin/sh
chown -R mysql:mysql /var/lib/mysql

sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/#port/port/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# init
service mysql start

mysql --user=$MARIADB_ROOT << EOF
UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User='$MARIADB_ROOT';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='$MARIADB_ROOT' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
FLUSH PRIVILEGES;
EOF

mysql --user=$MARIADB_ROOT --password=$MARIADB_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $MARIADB_DB;
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MARIADB_ROOT'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

sleep 3

service mysql stop

exec /usr/sbin/mysqld -u root